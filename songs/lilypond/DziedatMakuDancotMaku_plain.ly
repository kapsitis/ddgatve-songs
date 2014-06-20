\version "2.13.16"
%\header {
%    title = "Dziedāt māku, dancot māku"
%}
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4 
e8 e16[ d] cis8 b8 | a8 a d d | e8 e16[ d] cis8 b8 | a8 a d4 |
e16 d cis b a a d d | e16 d cis b a a d8
\bar "|."
} 


lyricA = \lyricmode {
Dzie -- dāt mā -- ku, dan -- cot mā -- ku, sie -- na pļau -- ti ne -- mā -- cēj'.
Dzie -- dāt mā -- ku, dan -- cot mā -- ku, sie -- na pļau -- ti ne -- mā -- cēj'.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
>>

\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



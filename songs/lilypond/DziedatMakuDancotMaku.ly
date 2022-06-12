\version "2.13.18"
#(ly:set-option 'crop #t)

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



voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
a'8 a16[ g] a8 a8 | a8 a fis fis | a8 g16[ a] a8 a8 | a8 a fis4 |
a16 a a g a a fis fis | a16 a a g a a fis8
\bar "|."
} 


lyricA = \lyricmode {
Dzie -- dāt mā -- ku, dan -- cot mā -- ku, sie -- na pļau -- ti ne -- mā -- cēj'.
Dzie -- dāt mā -- ku, dan -- cot mā -- ku, sie -- na pļau -- ti ne -- mā -- cēj'.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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



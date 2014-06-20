\version "2.13.16"
%\header {
%    title = "Apsedloju kumeliņu",AA lapas
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
\key a \minor
\time 4/4
d8[ e] f4 e d |
c4 b a a |
a'2 g4 g |
a2 e |
d8[ e] f4 e d |
c4 b a a |
d4 d c e |
d1
\bar "|."
} 

lyricA = \lyricmode {
Ap -- sed -- lo -- ju ku -- me -- li -- ņu, ai ku -- me -- li -- ņu,
sid -- ra -- bi -- ņa sed -- li -- ņie -- mi, ai -- jā, sed -- li -- ņiem.
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



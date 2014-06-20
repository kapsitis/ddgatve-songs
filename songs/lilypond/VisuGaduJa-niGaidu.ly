\version "2.13.16"
%\header {
%    title = "Visu gadu Jāni gaidu",AA lapas, Jāņi
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
\time 2/4
a8 a c c |
d8 d a b |
c8[d ] e4 |
d8[ c] d e |
e8 e d d |
e8 c b a |
\time 4/4
c4 b2. |
\bar "|."
} 

lyricA = \lyricmode {
Vi -- su ga -- du Jā -- ni gai -- du, lī -- go, lī -- go -- i, ne -- va -- rē -- ju sa -- gai -- dī -- ti, lī -- go! 
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



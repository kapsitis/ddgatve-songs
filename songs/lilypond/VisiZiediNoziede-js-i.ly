\version "2.13.16"
%\header {
%    title = "Visi ziedi noziedējši",AA lapas, Jāņi
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
\key c \major
\time 2/4
a8 a a a |
d8 c b a |
a4 d |
b4 d |
d8 a d d |
d8 c b a |
a4 d |
a4 b\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Vi -- si zie -- di no -- zie -- dēj -- ši, lī -- go, lī -- go, pa -- par -- dī -- te ne -- zie -- dēj' -- se, lī -- go, lī -- go!
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



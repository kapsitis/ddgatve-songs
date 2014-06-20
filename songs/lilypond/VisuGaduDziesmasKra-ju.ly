\version "2.13.16"
%\header {
%    title = "Visu gadu dziesmas krāju",AA lapas, Jāņi
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
e8 e d e |
e8 d c c |
e8 d c e |
e8 d c c |
\time 3/4
e4 e2 |
d4 c2 |
e4 e2 |
d4 c2 |
\bar "|."
} 

lyricA = \lyricmode {
Vi -- su ga -- du dzies -- mas krā -- ju, Jā -- ņu die -- nu gai -- dī -- da -- ma, lī -- go, lī -- go, lī -- go, lī -- go! 
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



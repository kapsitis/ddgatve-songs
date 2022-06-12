\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jāņa zelta cepurīte",AA lapas, Jāņi
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
c8 c e e |
e8 d c d |
\time 3/4 
d4 c2 |
d4 e2 |
\time 2/4
e8 c e e |
e8 d c e |
\time 3/4 
d4 c2 |
b4 c2 |
\bar "|."
} 

lyricA = \lyricmode {
Jā -- ņa zel -- ta ce -- pu -- rī -- te, lī -- go, lī -- go,
Rī -- gas tor -- ņa ga -- li -- ņā -- i, lī -- go, lī -- go
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



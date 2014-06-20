\version "2.13.16"
%\header {
%    title = "Velc, pelīte, bērnam miegu, lai Incītis neredzēj'"
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
g8 g c c |
\time3/4 
e8 d c4 c |
\time 2/4
g8 g c c |
\time3/4 
e8 e d2 |
\time 2/4
g,8 g c c |
\time3/4 
d8 e f4 f |
\time 2/4
d8 b c d |
\time3/4 
e8 d c2 |
\bar "|."
} 


lyricA = \lyricmode {
Velc, pe -- lī -- te, bēr -- nam mie -- gu, lai In -- cī -- tis ne -- re -- dzēj',
velc, pe -- lī -- te, bēr -- nam mie -- gu, lai In -- cī -- tis ne -- re -- dzēj'.
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




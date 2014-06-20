\version "2.13.16"
%\header {
%    title = "Saule savus kumeliņus"
%}
% Budēlīši, p.24
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
\time 4/8
e16[ d] c4 c8|
\time 3/8 
c8 d e |
\time 4/8
f16[ e] f4 f8 |
\time 3/8
f8 a4 |
\time 4/8
g16[ f] e4 g8 |
\time 3/8
a16[ g] g8 g |
\time 4/8
f16[ e] e4 e8 |
\time 3/8
d16[ c] c4|
\bar"|."
}


lyricA = \lyricmode {
Spī -- di nu, Sau -- lī -- te, Liel -- die -- nas rī -- tā, Spī -- di nu, Sau -- lī -- te, Liel -- die -- nas rī -- tā:
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



\version "2.13.16"
%\header {
%    title = "Es iesēju turku pupu"
%} 
% AALapas
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
\time 3/4
g8 g c4 c |
b8 c d4 d |
e8 d c2 |
g8 g c4 c |
b8 c d4 d |
e8 d c2 |
\repeat volta 2 {
\time 2/4
g'4 e8 c |
c8 e e c |
b8 d d b |
c8 c c4 |
}
} 

lyricA = \lyricmode {
Es ie -- sē -- ju tur -- ka pu -- pu ķir vir bam, sa -- vā ro -- žu dār -- zi -- ņā -- i ķir vir bam! 
To pu -- piņ', tur -- ka pu -- piņ ķir vir vir vir bam bam bam!
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



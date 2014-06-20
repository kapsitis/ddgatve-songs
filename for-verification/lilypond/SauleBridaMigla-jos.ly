\version "2.13.16"
%\header {
%    title = "Saule brida miglājos",AA lapas, Jāņi
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
\phrasingSlurDashed
c8 c c\( c\) |
\slurDashed
d8 c c( c) |
c8 c e d |
d8 c c4 |
d8 d e d |
d8 c c( c) |
c8 c e d |
d8 c c4 |
\bar "|."
} 

lyricA = \lyricmode {
Sau -- le bri -- da mig -- lā -- jos pa -- šā Jā -- ņu  va -- ka -- rā,
Sau -- le bri -- da mig -- lā -- jos  pa -- šā Jā -- ņu  va -- ka -- rā.
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



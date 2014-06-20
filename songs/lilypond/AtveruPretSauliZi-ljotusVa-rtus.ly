\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Liela diena, Saule
% Atveru pret sauli zīļotus vārtus
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/8
\phrasingSlurDashed
g'8 g\( g\) |
 g8 e e|
\phrasingSlurDashed
g8 e\( e\) |
g8 e4 |
\phrasingSlurDashed
g8 g\( g\) |
g8 e e |
\phrasingSlurDashed
f8 e\( e\) |
f8 e4
\bar"|."
}




lyricA = \lyricmode {
At -- ve -- ru pret Sau -- li zī -- ļo -- tus vār -- tus,
At -- ve -- ru pret Sau -- li zī -- ļo -- tus vār -- tus,
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



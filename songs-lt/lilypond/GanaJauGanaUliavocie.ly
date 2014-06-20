\version "2.13.16"
%\header {
%    title = "Gana, jau gana uliavocie"
%}
% "Skamba, skamba kankliai, 1993"
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
c'4 b8( d) a4 | g4 d2 | b'8( c) d4.( e8) | d8( b) d4 r |
c4 d a | g4 d2 | \phrasingSlurDashed c'4\( \times 2/3 { \slurSolid b8[( d b])\) } a4 | g2.
\bar "|."
} 

lyricA = \lyricmode {
Ga -- na, jau ga -- na u -- lia -- vo -- cie, čė -- sas, jau čė -- sas na -- mo ai -- cie. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { 
\oneVoice \autoBeamOff \voiceA }
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



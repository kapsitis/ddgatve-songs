\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Auga, auga rūžeņa"
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
\key g \major
\time 2/4
\slurDashed
e8[( e]) e fis | g4 g8[( g]) | fis4 g8 fis | e4 e |
g8[( g]) g a | b4 b8[( b]) | \slurSolid a8[( c8]) b a  | b4 b |
\slurDashed
a8 a a e | a8[( a8]) a8[( e]) | a8 c8 b a  | g4 g |
e8 e e fis | g8[( g8]) g8[( g]) | fis8 a8 g fis  | e4 e 
\bar "|."
} 



lyricA = \lyricmode {
Au-ga, au -- ga rū -- že-ņa Sor -- ko -- na duor -- zā, 
Au-ga, au -- ga rū -- že-ņa Sor -- ko -- na duor -- zā, 
Zam tū rū -- žu, zam_tū rū-žu Guļ jau -- na mei -- ti -- ne, 
Zam tū rū -- žu, zam_tū rū-žu Guļ jau -- na mei -- ti -- ne.
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



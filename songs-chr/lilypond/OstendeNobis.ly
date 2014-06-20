\version "2.13.16" 
%\header {
%    title = "Ostende nobis"
%}
% Chants de Taizé, #27
\paper {
line-width = 10\cm
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
\key d \minor
\time 3/4 
\partial 4*2
r8 a' a a 
\mark \markup { \musicglyph #"scripts.segno" }
\repeat volta 2 {
a4^\markup{ \circle \bold A} a d8 d | cis4 r8 a a a \bar "||"
a8^\markup{ \circle \bold B} a a4 g | a4 r e \bar "||"
f2^\markup{ \circle \bold C} d4 | e2 \times 2/3 { e8[( f g]) } \bar "||"
f2^\markup{ \circle \bold D} \times 2/3 { d8[( cis d]) } | e4 r8 a a a  
} \mark \markup { \musicglyph #"scripts.segno" }
e2.^"Fin."^\fermata
} 


lyricA = \lyricmode {
Os -- ten -- de no -- bis Do -- mi -- ne, mi -- se -- ri -- cor -- di -- am tu -- am. 
A -- men! A -- men! Ma-ra-na -- tha! Ma-ra-na -- tha! Os -- ten -- de 
-tha!
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



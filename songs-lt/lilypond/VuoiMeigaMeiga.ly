\version "2.13.16"
%\header {
%    title = "Vuoi mėiga mėiga"
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
\tempo 4=108
\clef "treble"
\key c \major
\time 3/4 
d'4 b b | d2 d4 | c2 b4 | a2. |
c4 c d | e2 e4 | d2 d4 | b2.  
\bar "|."
} 

lyricA = \lyricmode {
Vuoi mėi -- ga mėi -- ga mėi -- ge -- lė, 
Aš ta mėi -- ge -- lė ne -- la -- ba. 

}

voiceB = \relative c' {
\clef "treble"
\time 3/4
\key c \major
b'4 g g | b2 b4 | a2 g4 | d2. | 
a'4 a b | c2 c4 | b2 a4 | g2. 
\bar "|."
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { 
\voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



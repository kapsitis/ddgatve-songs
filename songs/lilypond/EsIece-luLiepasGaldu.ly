\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = " Es iecēlu liepas galdu klētī rudzu apcirknēi"
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
e8^\markup{ Viens } d d c |
c8 c c d |
d8 c c c |
f8 c c d |
e8^\markup{ Visi } c e d |
c8 d d4 |
f8 e f e |
e8 d d4 |
e8 c e d |
d8 c c4 |
\bar "|."
} 


lyricA = \lyricmode {
 Es ie -- cē -- lu lie -- pas gal -- du klē -- tī ru -- dzu ap -- cirk -- nē -- i,
 es ie -- cē -- lu lie -- pas gald' klē -- tī ru -- dzu ap -- cirk -- nē, 
 klē -- tī ru -- dzu ap -- cirk -- nē.
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




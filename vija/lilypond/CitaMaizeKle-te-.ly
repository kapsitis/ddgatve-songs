\version "2.13.16"
%\header {
%    title = "Cita maize klētēi, cita kambarēi"
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
\time 2/4 \mark \markup {  \circle \bold A }
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\phrasingSlurDashed
g'8\( g\) e\( e\)|  \mark \markup {  \circle \bold B }
\phrasingSlurDashed
g4 d8\( d\)|
\phrasingSlurDashed
g8\( g\) g\( g\)|
g4 d |
d8\( d\) f\( g\)|
g4 d8\( d\)|
g4 g8 g|
g4 d|
\bar "|."
} 


lyricA = \lyricmode {
Ci -- ta mai -- ze klē -- tē -- i, ci -- ta kam -- ba -- rē -- i,
ci -- ta mai -- ze klē -- tē -- i, cit kam -- ba -- rē -- i.
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




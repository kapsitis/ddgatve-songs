\version "2.13.16"
%\header {
%    title = "Atvelc, pelīt, bērniņam miegu"
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
\time 12/8
g'8 e4 g8 e4 f8 e f g g r |
g8 g4 g8 d4 g8 f f e e r |
g8 g4 a8 g4 a8 g f f e r |
g8 g4 g8 e4 f8 e e f e r | 
\repeat volta 2 {
\phrasingSlurDashed
g8 g\( g\) g e\( e\) f e f a g r | 
a8 g\( g\) g d\( d\) d g f e e r | 
g8 e4 f8 e4 f8 e f g g r |
a8 g4 g8 d4 g8 f e e e r |
}
} 

lyricA = \lyricmode {
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu, 
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu.
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu, 
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu.
Caur klē -- ti, caur na -- mu, caur is -- ta -- bi -- ņu, 
Caur klē -- ti, caur na -- mu, caur is -- ta -- bi -- ņu.
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu, 
At -- velc, pe -- līt, bēr -- ni -- ņam mie -- gu.
} 

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ 
Tā velc, _ pe -- līt, _ lai ka -- ķis ne -- redz, 
Tā velc, _ pe -- līt, _ lai ka -- ķis ne -- redz.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



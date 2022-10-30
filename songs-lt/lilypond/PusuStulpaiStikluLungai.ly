\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pušų stulpai, stiklų lungai"
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

#(define ((compound-time one two num) grob)
  (grob-interpret-markup grob
    (markup #:override '(baseline-skip . 0) #:number
      (#:line (
          (#:column (one num))
          #:vcenter "+"
          (#:column (two num))))
      )))


voiceA = \relative c' {
\tempo 8=150
\clef "treble"
\key c \major
\time 6/8
g'8 d'4 d8 b4 | a8 d4 d8 b4
<< {
\repeat volta 2 {
a8 a\rheel g\lheel b b b | a8 d4 d8 b4
}
\repeat volta 2 {
\time 4/8
g8 a b a
\time 6/8
a8 d4 d8 b4
}
}
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \voiceOne
\repeat volta 2 {
b8 a a b b a | g8 d'4 d8 b4
}
\repeat volta 2 {
\time 4/8
g8 a b b
s2.
}
}
>>
}

lyricA = \lyricmode {
Pu -- šų stul -- pai, stik -- lų lun -- gai. Vis ba -- re, vis ba -- re ma -- ni pat -- sai.
Aš ru -- ge -- lius pra -- skleis -- da -- ma...
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 6/8
g'8 b4 a8 g4 | a8 b4 a8 g4
\repeat volta 2 {
d8 d d g g g | a8 b4 a8 g4
}
\repeat volta 2 {
\time 4/8
g8 a b a
\time 6/8
a8 b4 a8 g4
}

}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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

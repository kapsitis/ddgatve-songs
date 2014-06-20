\version "2.13.16"
%\header {
%    title = "An tėveliaus dvaro"
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
\tempo 8=84
\clef "treble"
\key g \minor
\override Staff.TimeSignature #'stencil = #(compound-time "7" "6" "8")
\time 13/8
<< { d'8 c16[( a]) bes8 a g g bes \bar "dashed" d4( bes8) d8 c[( bes]) }
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \voiceOne \autoBeamOff \time 13/8
g16( d') c[( a]) bes8 a g g bes \bar "dashed" d4( g,8) d'8 c[( bes]) }
>>
d8 ees d c g g d' \bar "dashed" ees[( d]) c g4.
\bar "|."
} 

lyricA = \lyricmode {
An tė -- ve -- liaus dva -- ro ber -- žai ber -- žai.
O kas tuos ber -- ža -- lius už -- kirs, už -- kirs?
}


voiceB = \relative c' {
\clef "treble"
\key g \minor
\override Staff.TimeSignature #'stencil = #(compound-time "7" "6" "8")
\time 13/8
bes'8 a bes a g g bes \bar "dashed" bes4( bes8) bes8 c[( bes]) |
bes8 c bes a g g bes \bar "dashed" c8[( bes]) a g4.  
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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



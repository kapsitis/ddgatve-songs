\version "2.13.16"
%\header {
%    title = "Aisma, brolij, šiena pjautų"
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
\time 2/4
<< { d'8. b16 a8-\parenthesize\prall g | g8 a d d | d8 d b16[( g8.]) } 
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \autoBeamOff \voiceOne d'8.  c16  a8 g | a8 d  d d | d8 d b16[ a8.] }
>>
d8.-\parenthesize\rheel d16 d8 d 
<< { b16[( a]) b8 a a }
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \autoBeamOff \voiceOne b16[( a]) d8 a a16[ g] }
>>
g8 a d d | d8 d b4\fermata
\bar "|."
} 

lyricA = \lyricmode {
Ais -- ma bro -- lij, šie -- na pjau -- tų, da -- bi -- le,
oi da -- bi -- le, da -- bi -- lė -- li, da -- bi -- lė -- li ža -- lia -- sai. 
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4 
d'8. b16 a8 g | g8 a b b | a8 a g4 | b8. b16 a8 a | g8 g a a | g8 a b b | a8 a g4
\bar "|."
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



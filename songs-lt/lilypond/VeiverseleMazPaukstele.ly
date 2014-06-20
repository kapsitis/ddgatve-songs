\version "2.13.16"
%\header {
%    title = "Vėivėrselė, maž paukštelė"
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
\key g \major
\time 2/2 
<< { g'8[( a]) b4 a a8[( g]) | b4 d d c | d4. b8 a4. fis8 | g4 g a a } 
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \autoBeamOff \voiceOne  b4. g8 a4 a8[( g]) | b8( c) d4 d8( c)  c4 | s1 | g4 g8( a) a4 d8( c) }
>>
b4.( g8) a4.( g8) | b8[ c] d4 d4( c) | d4 b a a | g4 g a2 
\bar "|."
} 

lyricA = \lyricmode {
Vei -- vėr -- se -- lė, maž pauk -- šte -- lė, 
to že -- nuo -- jē, ton že -- me -- lė, 
ok lia, ok lia lia, 
to že -- nuo -- jē, ton že -- mel(ė).
}

voiceB = \relative c' {
\clef "treble"
\time 2/2
\key g \major
g'4 g d d | g4 b b a | b4. g8 <<d4. fis>> d8 | e4 e d d |
g2 d | g8[ a] b4 b( a) | b4 g <<d fis>> <<d fis>> | e4 e d2
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



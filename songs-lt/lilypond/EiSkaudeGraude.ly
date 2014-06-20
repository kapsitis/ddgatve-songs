\version "2.13.16"
%\header {
%    title = "Ei skaudė graudė"
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
\tempo 8=132
\clef "treble"
\key g \major
\time 6/8
<< { d'4. d4 c8 | b4( a8) a8[ g a] | b4. \times 3/4 { c4\reverseturn c\reverseturn } } 
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ <<
\new Voice = "voiceAA" { \autoBeamOff \voiceOne d4( e8) d4 c8 | s2. | b4 b8 s4. }
\new Voice = "voiceAB" { \autoBeamOff \voiceTwo b4( c8) b4 a8 | s2. | g4 g8 s4. }
>> }
>>
d'4( e8) e4. 
\repeat volta 2 {
\slurDashed d4( e8) d4-\parenthesize\rheel c8-\parenthesize\lheel | \slurSolid b4( a8) a4.-\parenthesize\lheel | \slurDashed d4( b8) \slurSolid c[( b]) a | b4.( b4.)
}
} 

lyricA = \lyricmode {
Ei skau -- dė grau -- dė mo -- na šėr -- de -- lė, 
ne-ga -- lio so -- grinž -- tė aš_i tie -- vėš -- kel(ė) 
}

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 6/8 
b'4. b4 a8 | g4( d8) d4. | g4. \times 3/4 { a4 a } | <<g4 b(>> c8) c4.  
\repeat volta 2 {
\slurDashed b4( c8) b4 a8 | \slurSolid g4( d8) d4. | \slurDashed b'4( g8) \slurSolid a[( g]) d | g4.( g) 
}
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



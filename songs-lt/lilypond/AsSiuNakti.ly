\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aš šių naktį"
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
\tempo 4=60
\clef "treble"
\key c \major
\time 2/4
<< { d'8.\rheel
\override ParenthesesItem #'font-size = #0
c16-\parenthesize\prall\rheel b8 a | d4 d | b4 a8 \breathe r }
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
%% { \autoBeamOff \voiceOne g16( d'8) c16 b8 a | <<b8 d>> <<b d>> <<a d>> <<a d>> | <<g,8( b>> <<d,) a'>> <<d,8 a'>> \breathe r }
{ <<
\new Voice = "voiceAA" { \voiceOne \autoBeamOff g16( d'8) c16 b8 a | d8 d d d | b8( a) a r }
\new Voice = "voiceAB" { \voiceTwo \autoBeamOff r2 | b8 b a a  | g8( d) d r }
>> }
>>
b'8 b c16[( a]) a[( d]) | d4 d | b4 a8 \breathe  r
\repeat volta 2 {
b8 b c16[( a]) a[( d]) | d8 d d d
}
\alternative { { b8( a) a8 \breathe r } { b2 } }
}

lyricA = \lyricmode {
Aš šių nak -- tį par nak -- te -- lį,
aš me -- ge -- lia ne -- me -- go -- jau,
ly -- gioj lan -- koj žir -- ge -- lį bal -- no -- jau,
-noj(au).
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
r2 | b'4 a | g4 d8 r |
g8 g a a | b4 a | g4 d8 r
\repeat volta 2 {
g8 g a a | b8 b  a a
}
\alternative { { g8( d) d8 r } { g2 } }
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

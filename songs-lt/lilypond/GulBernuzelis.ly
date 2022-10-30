\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Gul bernužėlis"
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
\time 2/4
\repeat volta 2 {
<< { d'4 b8 b | b4 d | c4 c8 b }

\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \autoBeamOff <<b8 d>> <<g, b>> <<g b>> <<g b>> | s2 | <<a8 c>> <<a c>> <<a c>> <<g b>> }
>>
c4 d
}
\repeat volta 2 {
b8 b d8. a16 | a8 a a fis | g8 g fis g
}
\alternative { { a4 \breathe d } { a2 } }
}

lyricA = \lyricmode {
Gul ber -- nu -- žė -- lis, gul ka -- rei -- vė -- lis.
štai at -- ai -- na trys pa -- nia -- las pa -- gal du -- na -- jė -- lia.
-jė(lia).
}

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
b'4 g8 g | g4 b | a4 a8 g | a4 b
}
\repeat volta 2 {
g8 g g8. d16 | d8 d d d | e8 e e e
}
\alternative { {
% \override ParenthesesItem #'padding = #0.2
\override ParenthesesItem #'font-size = #0
d4 <<\parenthesize d b'>> } { d,2 } }
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

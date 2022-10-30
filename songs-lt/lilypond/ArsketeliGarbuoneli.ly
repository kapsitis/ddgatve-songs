\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Arškėtėli garbuonėli"
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
\tempo 4=84
\clef "treble"
\key c \major
\time 4/4
\override Glissando #'style = #'zigzag
\override Glissando #'zigzag-width = #'0.75
\override Glissando #'bound-details = #'((right (attach-dir . 0) (padding . 1.0)) (left (attach-dir . 0) (padding . 1.0)))
d'4. c8 b[( a])\glissando g4 | c4 d e\glissando c |
<< { e4 e d\glissando c | g2 d'4.\rheel( b8) | e8[( d]) e4 d c }

\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ <<
\new Voice = "voiceAA" { \autoBeamOff \voiceOne e8[ d] e4 d c | g2 d' | e8[( d]) e4 d8[ b] c4 }
\new Voice = "voiceAB" { \autoBeamOff \voiceTwo s1 | s1 | c8[( b]) c4 b8[ g] a4 }
>> }
>>

g2\rheel
\bar "|."
}

lyricA = \lyricmode {
Arš -- kė -- tė -- li gar -- buo -- nė -- li,
ne -- sto -- vėk prie ke -- lio,
ne -- sto -- vėk prie ke(lio).
}

voiceB = \relative c' {
\clef "treble"
\time 4/4
\key c \major
\override Glissando #'style = #'zigzag
\override Glissando #'zigzag-width = #'0.75
\override Glissando #'bound-details = #'((right (attach-dir . 0) (padding . 1.0)) (left (attach-dir . 0) (padding . 1.0)))
d'4. c8 b[( a]) g4 | a4 g c\glissando g |
c4 c b a | g2 b4.( g8) | c8[( b]) c4 b a | g2
\bar "|."
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

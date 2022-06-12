\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kačeišami tāvs nūmyra"
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


chordsA = \chordmode {
\time 2/4
g2:5 | c4:5 g4:5 | 
\time 3/4
c4:5 g2:5 | 
\time 2/4
d4:5 g4:5 | 
g2:5 | 
c4:5 g4:5 | 
\time 3/4
c4:5 g2:5 | 
\time 2/4
d4:5 g4:5 | 
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g a b | c8 c b b | 
\time 3/4
c8 a g2 
\time 2/4
b8 a b4 |
g8 g a b | c8 c b b
\time 3/4
c8 a g2
\time 2/4
b8 a b4
\bar "|."
} 

lyricA = \lyricmode {
Ka -- čei -- ša -- mi tāvs nū -- my -- ra, 
ka -- la -- dō, ka -- la -- dō, 
Zī -- mas svāt -- ku rei -- te -- ņā -- i, 
ka -- la -- dō, ka -- la -- dō!
}


voiceB = \relative c' {
\time 2/4
g'8 g d g | a8 a g g | 
\time 3/4
a8 d, g2 
\time 2/4
g8 fis g4
g8 g d g | a8 a g g 
\time 3/4
a8 d, g2
\time 2/4
g8 fis g4
} 


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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




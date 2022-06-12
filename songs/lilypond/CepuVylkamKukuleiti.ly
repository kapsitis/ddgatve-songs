\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Cepu vylkam kukuleiti"
%}
%#(set-global-staff-size 18)
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
e2:m | e2:m | e2:m | b4:m e4:m |  
e2:m | e2:m | e2:m | b4:m e4:m |
}

voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
g'8 g g a | b8 a a g | b8 g g4 | a8 g g4 |
g8 g g a | b8 a g g | b8 g g4 | g8 a g4 
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
e8 e e fis | g8 fis fis e | g8 e e4 | fis8 e e4 |
e8 e e fis | g8 fis e e | g8 e e4 | e8 fis e4 
\bar "|."
} 

lyricA = \lyricmode {
Ce -- pu vyl -- kam ku -- ku -- lei -- ti, ka -- la -- dū, ka -- la -- dū!
Sā -- no -- luo -- si mār -- cā -- da -- ma, ka -- la -- dū, ka -- la -- dū!
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




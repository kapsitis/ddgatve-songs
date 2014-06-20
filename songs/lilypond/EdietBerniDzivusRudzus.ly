\version "2.13.16"
%\header {
%    title = "Ēdiet, bērni, dzīvus rudzus"
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
\repeat volta 2 {
g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 |  
}
g2:5 | c2:5 | g2:5 | g2:5 | g2:5 | c2:5 | g2:5 | g2:5 |
}



voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
b'8 d d d | d8 c b c | d4 c8 b | d4 c8 b |
b8 c d d | d8 c b c | d4 c8 b | d4 c8 b |
}
b8 b c d | e8 c b c | d4 c8 b | d4 c8 b |
b8 b c d | e8 c b c | d4 c8 b | d4 c8 b |
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
g'8 b b b | b8 a g a | b4 a8 g | b4 a8 g |
g8 a b b | b8 a g a | b4 a8 g | b4 a8 g |
}
g8 g a b | c8 a g a | b4 a8 g | b4 a8 g |
g8 g a b | c8 a g a | b4 a8 g | b4 g8 g | 
} 



lyricA = \lyricmode {
Ē -- diet, bēr -- ni, dzī -- vus ru -- dzus, to -- ta -- ri, to -- ta -- ri!
Zie -- mas svēt -- ku va -- ka -- rā -- i! to -- ta -- ri, to -- ta -- ri!
Sa -- kāp -- si -- mi cits uz ci -- ta, to -- ta -- ri, to -- ta -- ri!
Tad mēs Rī -- gu re -- dzē -- si -- mi, to -- ta -- ri, to -- ta -- ri!
} 


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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




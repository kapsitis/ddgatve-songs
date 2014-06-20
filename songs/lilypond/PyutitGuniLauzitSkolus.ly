\version "2.13.16"
%\header {
%    title = "Pyutit guni, lauzit skolus"
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
g2:5 | c4:5 g4:5 | d4:5 g4:5 | c4:5 g4:5 |   
g2:5 | c4:5 g4:5 | g2:5 | d4:5 g4:5 |
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
b'8 b a b | c8 c b b |
a8 a g4 | g8 a b4  |
b8 g a b | c8 c b b |
b8 a g4  | d8 d g4\fermata
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g fis g | a8 a g g |
fis8 fis g4 | g8 a g4  |
g8 g a g | a8 a g g |
g8 fis g4  | d8 d g4\fermata
} 

lyricA = \lyricmode {
Pyu -- tit gu -- ni, lau -- zit sko -- lus, 
ka -- la -- dō, ka -- la -- dō!
Lai -- dit Dī -- vu us -- to -- bā -- i! 
ka -- la -- dō, ka -- la -- dō!
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




\version "2.13.16"
%\header {
%    title = "Kam tie svēti svētki nāca"
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
c2:5 | c2:5 | c2:5 | c2:5 |
c2:5 | c2:5 | c2:5 | 
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 g g g | g8 f e e |
g8 f e4 | g8 f e4 |
e8 g g g | g8 f e e |
g8 f e4 |
\bar "|."
} 

lyricA = \lyricmode {
Kam tie svē -- ti svēt -- ki nā -- ca, 
ka -- la -- dū, ka -- la -- dū!
kam tā lie -- la Lie -- la -- die -- na? ka -- la -- dū!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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




\version "2.13.16"
%\header {
%    title = "Zīmys svātku četri bruoli"
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
g2:5 | g2:5 | g2:5 | c4:5 g4:5 |
g2:5 | g2:5 | g2:5 | d4:5 e4:m |  
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
d8 g g g | g8 fis e fis |
g8 e d4 | e8 fis g4 |
e8 fis g g | g8 fis e e |
g8 e d4 | d8 d e4 |
\bar "|."
} 

lyricA = \lyricmode {
Zī -- mys svāt -- ku čet -- ri bruo -- li, 
ka -- la -- dō, ka -- la -- dō!
Cyts iz cy -- tu o -- lu dzar -- tu, 
ka -- la -- dō, ka -- la -- dō!
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



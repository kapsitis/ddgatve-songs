\version "2.13.16"
%\header {
%    title = "Dancojieti, dancojieti"
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
g2:5 | g2:5 | g2:5 | d4:5 g4:5 |
}
\repeat volta 2 {
g2:5 | g2:5 | g2:5 | d4:5 g4:5 |
}
\repeat volta 2 {
g2:5 | g2:5 | g2:5 | d4:5 g4:5 |
}
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
%MS
d8 d b4 | d8 d b4 | d8 d d4 | c8 c b4
%ME
}
\repeat volta 2 {
d8 d b8. b16 | d8 d b8. b16 | d8 d d4 | c8 c b4
}
\repeat volta 2 {
d8 d b4 | d8 d b4 | d8 d d4 | c8 c b4
}
} 

lyricA = \lyricmode {
Dan -- co -- jiet, dan -- co -- jiet, ka -- la -- dō, ka -- la -- dō.
Dos saim -- nie -- ce de -- su riņ -- ķi, ka -- la -- dō, ka -- la -- dō.
Dan -- co -- jiet, dan -- co -- jiet, ka -- la -- dō, ka -- la -- dō.
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




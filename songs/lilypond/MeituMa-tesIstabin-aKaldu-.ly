\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Meitu mātes istabiņa kaladū",AA lapas
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
c2:5 | c2:5 | g4:5 c4:5 | g4:5 c4:5 |   
c2:5 | c2:5 | g4:5 c4:5 | g4:5 c4:5 |   
}
}



voiceA = \relative c' {
\clef "treble"
\key c \major
\repeat volta 2 {
\time 2/4
g'8 g g a |
g8 f e f |
g8 f e4 |
f8 e g4 |
g8 g g a |
g8 f e f |
g8 f e4 |
f8 e g4 |
} 
}

lyricA = \lyricmode {
Mei -- tu mā -- tes is -- ta -- bi -- ņa, ka -- la -- dū, ka -- la -- dū,
le -- dus kal -- na ga -- li -- ņā -- i, ka -- la -- dū, ka -- la -- dū!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



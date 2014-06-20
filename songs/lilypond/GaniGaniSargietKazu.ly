\version "2.13.16"
%\header {
%    title = "Gani, gani, sargiet kazu"
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
c2:5 | c2:5 | 
\repeat volta 2 {
f2:5 | f4:5 g4:5 |
}
}


voiceA = \relative c' {
\clef "treble"
\key g \major 
\time 2/4 
c'8 b c g | c8 b c g 
\repeat volta 2 {
a8. b16 c8 a | a8 g g4
}
} 


vardiBalssA = \lyricmode {
Ga -- ni, ga -- ni, sar -- giet ka -- zu, ka -- zai jā -- ja pre -- ce -- niek'. 
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \vardiBalssA
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



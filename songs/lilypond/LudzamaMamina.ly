\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lūdzama, māmiņa"
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
\time 3/8
d4.:5 | g4.:5 | d4.:5 | d4.:5 |
d4.:5 | g4.:5 | d4.:5 | g4.:5 |
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/8
a'8 d d | d8 b b | a8 d b | b8 a4 |
a8 d d | d8 b b | a8 d b | b8 a4
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 3/8
a'8 a a | a8 a a | a8 a a | g8 a4 |
a8 a a | a8 a a | a8 a a | g8 a4
} 

lyricA = \lyricmode {
Lū -- dza -- ma, mā -- mi -- ņa, laid bēr -- nus iek -- šā!
Lū -- dza -- ma, mā -- mi -- ņa, laid bēr -- nus iek -- šā!
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




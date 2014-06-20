\version "2.13.16"
%\header {
%    title = "Budēlīti, tēvainīti"
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
c2:5 | c2:5 | f2:5 | c2:5 | g2:5 | 
c2:5 | g2:5 | c2:5 | 
\repeat volta 2 {
c2:5 | c2:5 | f2:5 | c2:5 | 
}
\repeat volta 2 {
g2:5 | c2:5 | g2:5 | c2:5 |
}
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
%MS
g'8 g g g | g8 e e e | f8 f e d | f8 e e4 
%ME
d8 d d d | e8 e e e | d8 d d d | e8 e e4
\repeat volta 2 {
g4 g | g4 e8 e | f4 e8 d | f4 e8 e  
}
\repeat volta 2 {
d4 d8 d | e4 e8 e | d8 d d d | e8 e e4
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 e e e | e8 c c c | d8 d c b | d8 c c4 
g8 g g g | c8 c c c | b8 b b b | c8 c c4
\repeat volta 2 {
e4 e | e4 c8 c | d4 c8 b | d4 c8 c  
}
\repeat volta 2 {
b4 b8 b | c4 c8 c | b8 b b b | c8 c c4
}
} 

lyricA = \lyricmode {
Bu -- dē -- lī -- ti, tē -- vai -- nī -- ti, 
iz -- kul ma -- nu ve -- dek -- liņ',
Par ve -- dek -- las kū -- lu -- mi -- ņu 
es tev cim -- du pā -- ri doš'.
Spring, spring jē -- ri -- ņi, 
spring ka -- zu -- lē -- ni -- ņi,
Es pa -- te spriņ -- ģo -- ju 
Bu -- de -- lī -- šu  va -- ka -- rā.
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




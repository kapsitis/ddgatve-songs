\version "2.13.16"
% \header {
%    title = "Juoņu muote sīru sēja"
% }
% Katrīna Riekstiņa, #61 (Dziga)
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


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 2 {
\time 4/4
e8 g g g g f e f | g4 e8[ f] f4 e\fermata |
e8 g g g g f e f | g4 e8[ f] f4 e\fermata
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 2 {
\time 4/4
c8 e e e e d c d | e4 c8[ d] d4 c |
c8 e e e e d c d | e4 c8[ d] d4 c
}
} 


lyricA = \lyricmode {
Juo -- ņu muo -- te sī -- ru sē -- ja, 
lei -- guo, lei -- guo. 
De -- ve -- ni -- mi styu -- rei -- ši -- mi, 
lei -- guo, lei -- guo.
}

chordsA = \chordmode {
\time 4/4
c1:5 | c2:5 f4:5 c4:5 | 
c1:5 | c2:5 g4:5 c4:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



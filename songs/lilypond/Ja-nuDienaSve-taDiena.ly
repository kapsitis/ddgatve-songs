\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jāņa diena svēta diena"
%}
% Katrīna Riekstiņa, #42 (Rasa)
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
\repeat volta 4 {
\set Score.repeatCommands = #'((volta ""))
e8^\markup{1.,7. pants 6x; pārējie 4x} e e d c c c d | 
e4 c2.
\set Score.repeatCommands = #'((volta #f))
}
\repeat volta 2 {
g'8 g g  f g e e4 | g8 g g f g e e4 | g4 e2. 
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 4 {
s1 | s1 
}
\repeat volta 2 {
e8 e e d e c c4 | e8 e e d e c c4 | e4 c2.
}
}

lyricAA = \lyricmode {
Jā -- ņu die -- na svē -- ta die -- na, lī -- go,
lī -- go lī -- go ral -- lal -- lā, 
lī -- go lī -- go ral -- lal -- lā, 
lī -- go.
}

lyricAB = \lyricmode {
Aiz vi -- sā -- mi die -- ni -- ņā -- mi, lī -- go,...
}

chordsA = \chordmode {
\time 4/4
\repeat volta 4 {
c1:5 | c1:5
}
\repeat volta 2 {
c1:5 | c1:5 | c1:5
}
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
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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




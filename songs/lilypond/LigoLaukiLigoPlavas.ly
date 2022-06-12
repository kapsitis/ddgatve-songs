\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Līgo lauki, līgo pļavas"
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


voiceA = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
b8 e e e | e d d d \time 3/4
g4 a2 | b4 e,2 \time 2/4
e8 b'8 b b | a8 g fis e \time 3/4
g4 e2
\bar "|."
}}

voiceB = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
s2*2 \time 3/4
e4 fis2 | g4 e2 \time 2/4
b8 g'8 g g | fis8 e d b \time 3/4
e4 e2
\bar "|."
}}

lyricA = \lyricmode {
Lī -- go lau -- ki, lī -- go pļa -- vas, lī -- go, lī -- go,
Sa -- vas die -- nas, gai -- dī -- da -- mi, lī -- go.
}

chordsA = \chordmode {
\time 2/4
a2:m | a2:m | 
\time 3/4
a4:m g2:5 | a2.:m |
\time 2/4
a2:m | g2:5 | 
\time 3/4
a2.:m
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



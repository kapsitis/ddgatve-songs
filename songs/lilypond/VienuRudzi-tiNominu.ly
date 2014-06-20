\version "2.13.16"
% \header {
%    title = "Vienu rudzīti nominu"
% }
% Katrīna Riekstiņa, #58 (Grodi)
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
\key d \major
\time 4/4
d8 g g fis g fis fis16[ e] d8 |
fis4 a\fermata a g8[ fis] |
g8 fis a g a g fis16[ e] d8 |
fis4 a\fermata g fis\fermata
\bar "|."
} 


lyricA = \lyricmode {
Vie -- nu ru -- dzī -- ti no -- mi -- nu, lī -- go, lī -- go.
Jā -- ņu nak -- ti lī -- go -- da -- ma, lī -- go, lī -- go. 
}

chordsA = \chordmode {
\time 4/4
g1:5 | d1:5 | g2:5 d2:5 | d1:5 |
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



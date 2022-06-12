\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.59
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
\phrasingSlurDashed
e8 [f] g4 \( g8 a\) | g [f] e4. g8 | f [e] d4 d8 [e] | f4 e2 |
e8 [f] g4 g8 [a] | g [f] e4 g | f8 [e] d4 d8 [e] | d4 c2 \break |
d4 d4. c8 | e4 e \(e\) | f d4. e8 | f4 e2 |
d4 d4. c8 | e4 e \(e\) | f d4. e8 | d4 c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kūk -- lei - tis ska -- nē -- ja u -- pei -- tis mo -- lā,
kūk -- lei -- tis ska -- nē -- ja u -- pei -- tsi mo -- lā.
Kab ma -- ne zy -- nuot, _ kas tī -- i kūk -- liej',
kab ma -- ne zy -- nuot, _ kas tī -- i kūk -- liej'!
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



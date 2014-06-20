\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.35
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 5/4
f2 g4 f8 [g] f4 | d f2 e4 f | \time 4/4 g8 f e d f4 e8 [d] |
d1 | f4 g d g8 [f] | \time 5/4 f4 e8 [f] d2. \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- su dī -- nu svel -- me skrē -- ja pa le -- lu -- i tei -- ru -- meņ, pa le -- lū -- i tei -- ru -- meņ.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 5/4
s1 s4 | s1 s4 | \time 4/4 s1
d1~| d~ \time 5/4 d1~ d4  \bar"|."
}

lyricB = \lyricmode {
Ē-
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricB
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



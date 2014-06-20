\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.39
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
f4 bes8 [a] g4 f | g2 bes | a bes4 (g) |
g4 a bes bes | \time 3/4 a (g2) | \time 3/2 bes a g \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Lei -- goj saule, lei -- goj bi -- te
pa tū le -- lū tei -- ru -- me -- ņu.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 4/4
f4 bes8 [a] g4 f | g2 g |f g4 (g) |
e4 f g g | \time 3/4 f (g2) | \time 3/2 g f g \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
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



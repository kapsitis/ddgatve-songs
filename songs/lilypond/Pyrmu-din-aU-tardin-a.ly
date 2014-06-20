\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.97
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 5/4
a8 a a a g a bes4 g | bes8 bes bes bes a bes c4 a |
\time 3/4 d8 d d4 bes | c8 c c4 a | \time 5/4 bes8 bes bes bes a g a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pyr -- mū -- di -- ņa, ū -- tar -- di -- ņa, pyr -- mū -- di -- ņa, ū -- tar -- di -- ņa
tei bej mei -- tu pu -- ču dī -- na, tei bej mei -- tu pu -- ču dīn!
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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



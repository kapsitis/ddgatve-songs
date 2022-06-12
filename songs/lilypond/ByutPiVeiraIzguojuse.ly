\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.93
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
e8 d c b | a g g g | g g a b | c c c c |
a a a a | g g g4 | g8 g a b | c c c c \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Byut' pi vei -- ra iz -- guo -- ju -- se, kab na vī -- nas buo -- bas pļauk -- šas,
ran -- dik, rin -- dik ra -- ta -- tā! Kab na vī -- nas buo -- bas pļauk -- šas.
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



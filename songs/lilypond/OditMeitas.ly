\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.15
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c'8 g g g | c g g g | c g g g | a g g4 |
e'8 e f e | e d d4 | d8 d e d | d c c4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
O -- dit, mei -- tas, kū o -- di -- ti, o -- dit, mei -- tas, kū o -- dit,
vyl -- kam ze -- čes nū -- o -- dit, vyl -- kam ze -- čes nū -- o -- dit.
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



\version "2.13.18"

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

%chordsA = \chordmode {}

voiceA = \relative c'' {
\clef "treble"
\key bes \major
\time 4/4

bes4 a8 (g) f4 f | g f8 (es) es4 d | f f g c | bes a bes2 |
d4 bes bes8 (c) d4 | c bes a8 (bes) c4 | bes a g c8 (bes) | a4 g f2 \bar"||"
bes4^\markup { \translate #'( -8 . 0 ) \italic Refrēns } a8 (g) f4 f | g f8 (es) es4 d | f bes g c | bes a bes2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Svē -- tais Krusts, Tev go -- du do -- du, šeit mans Kungs bij' pie -- nag -- lots.
Pas -- tar -- die -- nā lie -- lā go -- dā mir -- dzē -- si Tu ap -- skaid -- rots.
Sla -- vēts lai ar mu -- ti sir -- di ma -- na Kun -- ga Jē -- zus Krusts.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
>>


\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



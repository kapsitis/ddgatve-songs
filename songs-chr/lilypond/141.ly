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

chordsA = \chordmode {
g2 g d g1 g2 d g1 c1. g g2 d g
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4

g4 a | b2 | a | g | b4 c | d2 | c | b | d4 d | e4. c8 | c2 | e4 e | d4. b8 | g2 | g4 a | b2 | a | g \bar"|."
}

lyricA = \lyricmode {
Sa -- ku jā, jā, jā. Sa -- ku jā, jā, jā. Sa -- ku jā, mans Kungs, sa -- ku jā, mans Kungs, sa -- ku jā, jā, jā!
}

fullScore = <<
\new ChordNames { \chordsA }
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



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
c4:7 f1 d:min f1. c2:7 f2. f4:7 bes2 bes:min f2 c f2.
}

voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4

\repeat volta 2 {
\partial 4
\times 2/3 {c8 d e} | f4 f8. f16 f4 \times2/3 {f8 f f } | f2 d | c4 f8. f16 f4 g8. a16 |
a2 g | a f4 \times 2/3 {f8 g a} | bes2 (f4) g | a bes8. a16 g4 a8. g16 | f2.
}
}

lyricA = \lyricmode {
Lai Tev ir sla -- va un gods, un pa -- tei -- cī -- ba. Sla -- va un gods lai Tev, Jē -- zu!
Sla -- va, lai Tev ir sla -- va, sla -- va lai Tev ir un gods.
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



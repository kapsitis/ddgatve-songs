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
s4 es2 as4 es2:sus as4 es2. bes2 g4 c2:min bes4 e2:sus as4 es4 as bes es2.
}

voiceA = \relative c' {
\clef "treble"
\key es \major
\time 3/4
\partial 4

es4 | bes'4 bes c8 as | bes4 bes as | g g8 f g as | f4 f g | es2 bes'8 [(f]) | g2 as4 | g as8 g f4 | es2. \bar"|."
}

lyricA = \lyricmode {
Nāc, Mie -- ra Ka -- ra -- lie -- ne, mūs aiz -- stā -- vi sa -- vās lūg -- snās. Glāb mūs, glāb mūs, glāb, mēs Te -- vi lū -- dzam.
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



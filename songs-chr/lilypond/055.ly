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
e1.:min c:6 d2. e:min d e:min c b2 e2.:min
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 3/4

b4. a8 g4 | b4. a8 g4 | c4. d8 e4 | c4. d8 e4 | d4. c8 b a | b a g2| d'4. c8 b a | b a g2 |
\repeat volta 2 {e4 e e16 [(fis]) g8 | \time 2/4 \stemUp b4 \times 2/3 {b8 a b} \stemNeutral | \time 3/4 a g~ g2}
}

lyricA = \lyricmode {
An -- ge -- lus, An -- ge -- lus Do -- mi -- ni, Do -- mi -- ni nun -- ti -- a -- vit Ma -- ri -- ae, nun -- ti -- a -- vit Ma -- ri -- ae et con -- ce -- pit de Spi -- ri -- to San -- cto.
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



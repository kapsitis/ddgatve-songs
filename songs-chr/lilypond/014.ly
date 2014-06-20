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

chordsA = \chordmode {d1 fis2:min b1:min d2 a1 g2 d a:7 d}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

\repeat volta 2 {fis4. e8 d2 | a'4. g8 fis2}
\alternative {
  {b4 a fis g | fis2 e}
  {b'4 b a d | cis2 d \bar"|."}
}
}

lyricA = \lyricmode {
Glo -- ri -- a, glo -- ri -- a in ex -- cel -- sis De -- o! in ex -- cel -- sis De -- o!
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


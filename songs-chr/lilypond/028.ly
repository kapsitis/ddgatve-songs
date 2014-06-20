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

chordsA = \chordmode { s2 a2 b4:min g fis2:min g d e a g2 d a d }

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

\repeat volta 2 {fis8 fis fis4 a8 a a4 | d d cis2 }
\alternative {
  {b2 a4 fis | e2 e }
  {b'2 a4 d | cis2 d \bar"|."}
}
}

lyricA = \lyricmode {
Gods lai ir, gods lai ir, gods lai ir Tē -- vam un Dē -- lam, Svē -- ta -- jam Ga -- ram. }


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


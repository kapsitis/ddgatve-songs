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
d1 a e:min b:min b2:min g d1 e2:min g d4 a d2
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

d4 (e) fis2 | a e | e4 (fis) g2 | b2 fis |
fis4 (b) b2 | a fis | e4 (fis) g2 | fis4 (e) d2 \bar"|."
}

lyricA = \lyricmode {
Jē -- zu, Jē -- zu! Jē -- zu, Jē -- zu!
Jē -- zu, Jē -- zu! Jē -- zu, Jē -- zu!
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



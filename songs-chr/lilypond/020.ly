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

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

\repeat volta 3 {fis4 g a b | a (g) fis2 | fis4 g a b8 b | a4 (g) fis2 |
a4 a8 a g4 a8 [(g)] | fis4 fis e e | fis g a b | a8 [(g]) fis4 e2 | d1^\markup { \translate #'(4 . 0) \italic 3x} }
}

lyricA = \lyricmode {
Svēts ir, svēts ir, svēts ir, svēts ir, pa -- tie -- si svēts ir Kungs Jē -- zus Kris -- tus Vis -- svē -- ta -- jā, Augst -- cie -- nī -- tā Sa -- kra -- men -- tā.
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


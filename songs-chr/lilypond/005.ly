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

voiceA = \relative c'' {
\clef "treble"
\key e \major
\time 4/4

\dynamicUp
gis2\p fis | a4 gis fis2 | b4\mp a8 [(fis]) a4 gis | fis2 r2 |
gis2\f fis4 fis | a (gis) fis fis | b cis b8 gis e4 | fis2 fis4 fis | b2 gis | a8 [(gis]) fis4 e2 | 
gis fis | a gis | gis4 gis a b | b2 fis4 gis4 | cis2 b | a8 [(gis]) fis4 e2 \bar"|."
}

lyricA = \lyricmode {
Svēts, svēts, svēts ir Kungs, de -- bess -- pul -- ku Dievs, 
De -- bess un ze -- me ir Ta -- vas go -- dī -- bas pil -- na. Ho -- san -- na aug -- stu -- mos.
Svē -- tīgs, svē -- tīgs, kas nāk Kun -- ga vār -- dā. Ho -- san -- na aug -- stu -- mos.
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
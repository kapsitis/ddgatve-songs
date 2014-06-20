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

voiceA = \relative c'{
\clef "treble"
\key a \major
\time 4/4
\dynamicUp
e1\p | a | d,2. e4 | e1 | fis2.\mf a4 | a2 b | cis1 |
cis2\f cis4 cis | a2 fis | a fis4 a | cis2 a4 a | d2 cis | b a4 b | cis2 a4
e\f | cis'2 a4 a | d2 cis | b2. a4 | a1 |
cis2\p cis4 cis | a2 fis4 a | cis2 a4 e\f | cis'2 a4 a | d2 cis | b2. a4 | a1\fermata \bar "|."
}

lyricA = \lyricmode {
Svēts, svēts, svēts ir Kungs, de -- bess -- pul -- ku Dievs.
De -- bess un ze -- me, de -- bess un ze -- me ir Ta -- vas go -- dī -- bas pil -- na.
Ho -- san -- na, Ho -- san -- na aug -- stu -- mos!
Svē -- tīgs, kas nāk Kun -- ga vār -- dā. Ho -- san -- na, Ho -- san -- na aug -- stu -- mos!
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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
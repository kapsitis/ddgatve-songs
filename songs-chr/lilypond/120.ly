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
c2. g2 a1:min d2:min g c1 f2 e a1:min d2:min g c1 
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
%\dynamicUp

e8 c e4 e | \time 2/4 d8 e d c | \time 4/4 c1 | d8 e f d c c b b | c1 |
f8 f f16 [g] a8 b b gis16 [a] b8 | c d e d c2 | d,8 e f d c c b b | c1 \bar"|."
}

lyricA = \lyricmode {
Ju -- be Dom -- ne be -- ne -- di -- ce -- re, ju -- be Dom -- ne be -- ne -- di -- ce -- re. 
Ju -- be,  Ju -- be Dom -- ne  Dom -- ne be -- ne -- di -- ce -- re, 
Ju -- be Dom -- ne be -- ne -- di -- ce -- re.
}

lyricB = \lyricmode {
Kungs, mēs lū -- dzam Ta -- vu svē -- tī -- bu, Kungs, mēs lū -- dzam Ta -- vu svē -- tī -- bu.
Kungs, mēs, Kungs,  mēs lū -- dzam  lū -- dzam Ta -- vu svē -- tī -- bu,
Kungs, mēs lū -- dzam Ta -- vu svē -- tī -- bu.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



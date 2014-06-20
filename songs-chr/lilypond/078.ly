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
e2 b1 e a2 b:7 e1 b:7 e b:7 e a e a e a e fis:7 b2:7
}

voiceA = \relative c''{
\clef "treble"
\key e \major
\time 4/4

gis8 e gis e fis4. e8 | dis fis4. e2 | gis8 e gis e a2 | cis b |
gis8 e gis e fis4. e8 | dis fis4. e2 | gis8 e gis e fis2 | dis e4. e8 |
e e e dis cis4. e8 | a cis4. b e,8 | e e e dis cis4. e8 |
a cis4. b e,8 | e e e dis cis4. e8 | a cis4. b2 | gis4 gis ais2 | fis b \bar"|."
}

lyricA = \lyricmode {
Cik Tu e -- si brī -- niš -- ķīgs, mans Kungs! Cik Tu e -- si brī -- niš -- ķīgs! Ma -- na sirds dzied sa -- vam Glā -- bē -- jam: Cik Tu e -- si brī -- niš -- ķīgs! Tu e -- si Glā -- bējs, kas mūs at -- brī -- vo! Tu e -- si mū -- su Kungs, Tu va -- di mūs Tu uz -- va -- rē -- tājs, kas mums dā -- vi -- ni sa -- vu uz -- va -- ru.
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
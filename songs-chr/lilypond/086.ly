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
s4 e2. b a2 cis:min a b:7 gis2.:min cis4:min e2 b e1
}

voiceA = \relative c'{
\clef "treble"
\key fis \minor
\time 3/4
\partial 4

e8 fis |
\repeat volta 2 { gis4. gis8 a gis | fis2 fis8 gis | \time 4/4 e2 e4. e8 | cis'4. cis8 cis b a cis | b4 b2 e,8 fis | gis4 gis8 gis fis e e dis | e4 e2 e8 fis \time 3/4}
}

lyricA = \lyricmode {
Dzie -- dā -- šu Tev, Kungs un Dievs, va -- re -- nī -- ba, ak, Kungs, Tu ce - rī -- ba ma -- na, uz -- ti -- cos Tev un ne -- bai -- dī -- šos mū -- žam. Dzie -- dā-
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
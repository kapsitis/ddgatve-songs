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
g2. e:min b:min b:7 c a:min d d:7 d:7 c b:7 e:min a g e:min a:min d:7 g4 a2:min g2.
}

voiceA = \relative c''{
\clef "treble"
\key g \major
\time 3/4

\repeat volta 2 {g8 [(a]) g2 | g8 [(a]) g2 | fis4. e8 d e | fis2. | e4. d8 c d | e2 e8 (< e g >) | d2 e4 }
\alternative {
 {fis2.}
 {fis2 d8 [(fis]) |}
}
g2 e8 [(g])| a2 fis4 | g4 (fis4.) g8 | a ([b] a2) | b8 [(c]) b2 | b8 [(c]) b2 | b a4 | c2 b4 | b8 ([a] g2 | g2.) \bar"|."
}
lyricA = \lyricmode {
Svēts ir, svēts ir, svēts ir mū -- su Dievs. Svēts ir mū -- su Dievs vis -- va -- re -- nais. _ Kurš bij, kurš ir, kurš at -- kal nāks, svēts ir, svēts ir, svēts ir mū -- su Dievs.
}
lyricB = \lyricmode {
Jē -- zus, Jē -- zus, Jē -- zus mū -- su Kungs. Svēts ir mū -- su Dievs vis -- va -- re -- nais. _ Kurš bij, kurš ir, kurš at -- kal nāks, svēts ir, svēts ir, svēts ir mū -- su Dievs.
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
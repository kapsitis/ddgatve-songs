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
s2. e1.:min s4 d4 g2 c4 g d2 g8 d e4:min c1 b2 e4:min a:min6 b2 e4:min a:min6 b1
}

voiceA = \relative c'{
\clef "treble"
\key e \minor
\time 4/4
\partial 2.

r8 dis dis dis cis dis |
\repeat volta 2 { e4. e8 e4 e8 fis | g fis e fis g4 a | b8 b b b c4 b | a r8 b b a g fis | e4. e8 e4 e8 fis | dis dis dis dis e4 fis | dis8 dis dis dis e4 fis | dis r8 dis dis dis cis dis
}
}
lyricA = \lyricmode {
Vis -- tum -- šā -- ka -- jā nak -- tī, Kungs, ie -- de -- dzi -- ni sa -- vu lies -- mu, ku -- ra kvē -- los mū -- žī -- gi, vis -- tum -- šā -- ka -- jā nak -- tī, Kungs, ie -- de -- dzi -- ni sa -- vu gais -- mu, ku -- ra kvē -- los mū -- žī -- gi. Vis -- tum -- šā -- ka -- jā
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
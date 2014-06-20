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
d1 d g d b:min d
b:min a d d g d
b:min d g a d1.
a2. d1. d2 g4 a1 d2 
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

d2 fis4 g | a2 a | \stemUp b4 (a) g (b) \stemNeutral | a2 a | d \( cis4 b \) | a2 fis |
fis4 (g) fis e | e2 e4 r | d2 fis4 g | a2 a | \stemUp b4 (a) g \(b\) \stemNeutral | a2 a |
d2 cis4 b | a2 fis | fis4 (g) fis e | e2 e \bar"||"  \time 3/4 fis4 g a | fis2 g4 | 
e (d) e | e8 (fis) fis4 r | fis g a | fis~ fis g | e d e | e d2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
La -- bais Vis -- aug -- stais, va -- re -- nais Dievs, vie -- nī -- gi Te -- vi
pie -- nā -- kas go -- dāt, vie -- nī -- gi Te -- vi cil -- di -- nāt, sla -- vēt,
cil -- vēks nav cie -- nīgs saukt Te -- vi vār -- dā. Sla -- va Tev, Dievs, par
mā -- su sau -- li, die -- nu, kas at -- nes, gais -- mu mums dā -- vā.
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



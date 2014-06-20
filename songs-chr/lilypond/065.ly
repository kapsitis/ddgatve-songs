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
s4 d1 g d a:7 d g d2 a:7 d1
d g a:7 d4 g a2 a1:7 d
}

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 4/4
\partial 4

a8 a | a4 fis8 e d4 e8 d | b d4.~ d4 a'8 a | a4 fis8 e d4 fis | e2. a8 a |
a4 fis8 e d4 e8 d | b d4.~ d4 d8 e | fis a a g fis4 e | d1 \bar"||" \break
\repeat volta2 { a'8^\markup {\translate #'(-9 . 0 ) \italic Refrēns} a4 fis8 d4 a' | b8 b4 g8 d4 b' }
\alternative {
  {cis4. b8 a g fis e | d4 b'a2 }
  {cis4. b8 a g fis e | d4 fis d2 \bar"|."}
} 
}

lyricA = \lyricmode {
\set stanza = "1. "
Prie -- ku ie -- dves, ak, Kungs, ma -- nā sir -- dī, prie -- ku ie -- dves, es lū -- dzu, Tēvs.
Prie -- ku ie -- dves, ak, Kungs, ma -- nā sir -- dī, lai es Te -- vi vien -- mēr sla -- vē -- ju.
Dzie -- diet ho -- san -- na, dzie -- diet ho -- san -- na. Dzie -- diet Kun -- gam Viņš ir mū -- su Dievs.
Mū -- žam svē -- tīts lai ir Vi -- ņa vārds.
}
lyricB = \lyricmode {
\set stanza = "2. "
Mie -- ru ie -- dves, ak, Kungs, ma -- nā sir -- dī, mie -- ru ie -- dves, es lū -- dzu, Tēvs.
Mie -- ru ie -- dves, ak, Kungs, ma -- nā sir -- dī, lai šo mie -- ru ci -- tiem dā -- vā -- ju.
}
lyricC = \lyricmode {
\set stanza = "3. "
Sa -- vu Ga -- ru, ak, Kungs, sū -- ti pār mums, sa -- vu Ga -- ru, ak, sū - ti mums.
Sa -- vu Ga -- ru, ak, Kungs, sū -- ti pār mums, lai mums arvien stip -- ra ti -- cī -- ba.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



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
s4 g2. e:min a2:min d4 g2. g e:min a2:min d4 g1
g2. e:min a2:min d4 g2. g e:min a2:min d4 g
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/4

\partial 4
d4^\markup {\translate #'(-10 . 0) \italic Refrēns} \bar"||" g2 b4 | g2. | a4 g a | b2 d,4 | g2 b4 | g2. | a4 g fis | g2 s4 \bar"||" \break
\partial 4
d4 | g2 b4 | g2. | a4 g a | b2 d,4 | g2 b4 | g2. | a4 g fis | g2 s4 \bar"|."
}

lyricA = \lyricmode {
Kungs, pie -- ņem mūs, svē -- tī, Kungs, mūs: Tev tīrs un svēts u -- pu -- ris būs.
\set stanza = "1. "
Tu mai -- zi mums, vī -- nu mums dod, Tev šo -- dien, Kungs, dā -- vi -- nām to.
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "2. "
Tu mū -- su Tēvs, Jē -- zus Tavs Dēls, Viņš brā -- lis mums, sla -- va Tev, Kungs!
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "3. "
Tu mī -- li mūs, Tu mū -- su Tēvs. Tev bēr -- ni dzied, sla -- va Tev, Kungs!
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



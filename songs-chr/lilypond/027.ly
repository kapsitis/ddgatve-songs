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

chordsA = \chordmode {d1 g a:7 g2 d b1:min e:min a:7 d2:sus4 d1. g1 a:7 g2 d b1:min e:min a:7 d2:sus4 d}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

fis8 fis fis fis fis fis a4 | a8 g g fis g4 g | e2 e4 g | g2 fis |
r8 d d d d d e fis | fis 4. e8 e4 d | cis8 cis cis cis cis cis d e | e2 d |
fis4 fis fis8 fis a4 | a g8 [(fis]) g4 g | e e8 e e4 g | g2 fis |
d8 d d4 d fis | fis8 e e d e4 e | cis2 d4 e | e2 d \bar "|."
}

lyricA = \lyricmode {
Svei -- ci -- nā -- ta, Ma -- ri -- ja, žē -- las -- tī -- bas pil -- nā, Kungs ir ar Te -- vi, Tu e -- si svē -- tī -- ta starp sie -- vie -- tēm, un svē -- tīts Ta -- vas mie -- sas aug -- lis Jē -- zus.
Svē -- tā Ma -- ri -- ja, Die -- va Mā -- te, lūdz par mums grē -- ci -- nie -- kiem ta -- gad un mū -- su nā -- ves stun -- dā. A -- men. Ma -- ri -- ja, a -- men.
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


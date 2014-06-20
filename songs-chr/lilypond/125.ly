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
s4 g2:min f g1:min es2 f
bes d:7 g:min f g1:min es2 d:min g1:min
s4 g2:min f g1:min es2 f bes2. d4:7
g2:min f g1:min es2 d:min g2.
}

voiceA = \relative c' {
\clef "treble"
\key g \minor
\time 4/4
\partial 4

d4^\markup {\translate #'(-10 . 0) \italic Refrēns} | bes' bes a8 a4. | g2 r4 d | g g f8 f4. |
d2 r4 d | bes' bes a8 a4. | g2 r4 d | g g f8 f4. | g2 r4 s4 \bar"||" \break
\partial 4
d^\markup {\translate #'(-8 . 0) \italic Solo} | bes'2 a | g r4 d8 d | g4 g f f | d c8 d~ d4 d |
bes'bes a8 a4. | g2 r4 g8 g | g4 g f8 f4. | g2 r4 s \bar"|."
}

lyricA = \lyricmode {
Nāc, Svē -- tais Gars, pār mums, nāc, Tē -- va Gars, pār mums.
Nāc, Jē -- zus Gars, pār mums un da -- ri brī -- nu -- mus!
\set stanza = "1. "
Ar Ma -- ri -- ju jau -- nus Va -- sar -- svēt -- kus pie -- dzī -- vot, kad
Svē -- tā Ga -- ra spēks u -- guns mē -- lēm pār mums nāks!
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "2. "
Lai slu -- di -- nām vi -- sur Jē -- zu aug -- šām -- cē -- lu -- šos, kad
Svē -- tā Ga -- ra spēks u -- guns mē -- lēm pār mums nāks!
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



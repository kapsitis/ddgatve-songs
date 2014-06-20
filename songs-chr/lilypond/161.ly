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
d1. d1. d2. a1. d
d1. d2. fis1.:min b2.:min e:7 a1.
d2. g a d g1. d2. a1.
d2. b:min g d a1. d
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 6/8

d4. d4 d8 | fis4.~ fis4 d8 | d4. d4 e8 | fis4. fis | fis fis4 g8 | e4.~ e4 e8 | e4. e4 fis8 | d2.~ | d |
d4. d4 d8 | fis4.~ fis4 d8 | d4. d4 e8 | fis4. fis | fis fis4 fis8 | b4. b4 b8 | b4. b4 a8 | a2.~ | a |
d4. d4 d8 | d4.~ d4 d8 | cis4. b4 a8 | a4. a | g g4 g8 | b4. b4 a8 | a4. fis4 e8 | e2.~ | e |
fis4. fis4 a8 | d,4. d4 d8 | g4. g4 fis8 | fis4. fis | e e | e~ e4 d8 | d2.~ | d \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Dzī -- vot no mī -- las, pa -- tu -- rēt Te -- vi, Mū -- žī -- go vār -- du, ko de -- vis Dievs.
Die -- viš -- ķais Jē -- zu, mī -- lu es Te -- vi, vie -- nī -- gi Tev ma -- na dvē -- se -- le kvēl.
Dzī -- vot no mī -- las, iz -- nī -- dēt bai -- les, pa -- gāt -- nes kļū -- das, kas at -- mi -- ņā gail.
Ne -- re -- dzu ag -- rā -- ko grē -- ku ne zī -- mes, Ta -- va mī -- la tik vien.
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



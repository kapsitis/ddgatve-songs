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
a4 g d1 d1 b1.:min b4:min a d1 d1 a1. a4 g d1 d1 b:min
s2 b4:min a d1 a d
}

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 4/4
\partial 2

a4 b | fis4. (e8) d4 r | r fis8 fis fis fis e d | e4. (d8) b2 |
r4 r8 d8 d4 e | fis1 | r8 fis fis fis e4 d | fis8 \( e4.~ e2 \) |
r2 a4 b | fis4. (e8) d4 r | r fis8 fis fis fis e d | e4. (d8) b2 \bar"||" \break
r2 d4 e | fis4. (e8) d2 | r4 a8 a fis' (e4) fis8 | d2 r \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1.-5. "
Re -- dzi Jē -- zu, lūk, Viņš iet pa jū -- ras vir -- su,
Viņš nāk pie mums un pa -- līdz pie -- cel -- ties. _
Re -- dzi Jē -- zu, kas spēj no -- mie -- ri -- nāt viļ -- ņus.
\set stanza = "1. "
Mī -- li Jē -- zu, jo Viņš te -- vi mīl.
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



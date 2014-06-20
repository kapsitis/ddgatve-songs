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
s4. d1. d a1:7 d2 d:7 g1 d2. a4:7 d2
}

voiceA = \relative c'{
\clef "treble"
\key d \major
\time 2/4
\partial 4.

d8 fis g | a2 | r8 d, fis g | a2 | r8 d, fis g | a4 fis | d fis | e2 |
r4 fis8 e | d4. d8 | fis4 a | a8 g4. | r8 g fis g | a4 fis | d e | d2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kad mū -- su Kungs at -- grie -- zī -- sies, kad mū -- su Kungs at -- grie -- zī -- sies,
gri -- bam mēs tad būt pie Vi -- ņa, kad mū -- su Kungs at -- grie -- zī -- sies.
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
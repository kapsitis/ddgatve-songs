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
s2 c1 f2 c1. c1 d2:min g1. c1 f2 c1 f2 c1 g2 c1
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 6/4
\partial 2

c4 e | g4. g8 g2 a4 a | g1 c,4 e | g4. g8 g2 f4 e | d1 c4 e | g4. g8 g2 a4 a | g1 f2 | e2. (c4) d d | c1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kungs, kāds lū -- dzas šeit, e -- si klāt! Kungs, kāds lū -- dzas šeit, e -- si klāt!
Kungs, kāds lū -- dzas šeit, e -- si klāt! Ak, Kungs, e -- si klāt!
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



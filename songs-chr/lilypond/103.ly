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
s8 g1 d e2:min c2 d1
c2 d g1 c2 d g1
c2 d g4 d e2:min c d g2.
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 4/4
\partial 8
\repeat volta 2 {
g8 |  g4. (d8) d4 r8 g | a4. (d,8) d4 r8 a' | b ([a]) g ([fis]) g4 b |  a2. r8
}
\break
r8 | r4 c8 c c b a b~ | b2 r2 | r4 c8 c c b a b~ | b2 r2 | 
r4 c8 c c b a b~ | b4 a g r8 b | c b a g a4. g8 | g2. r8 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ho -- san -- na, ho -- san -- na, ho -- san -- na aug -- stī -- bā!
Vien -- mēr sla -- vē -- šu es. Ma -- nā sir -- dī ir prieks.
Jē -- zus ma -- ni ir mī -- lē -- jis ar mī -- les -- tī -- bu mū -- žī -- gu.
}
lyricB = \lyricmode {
\set stanza = "2. "
Gods Die -- vam, gods Die -- vam, gods Die -- vam aug -- stī -- bā!
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



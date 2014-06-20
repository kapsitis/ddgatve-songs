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
d8:min a d4:min a d4.:min c8 f1 bes4 f4. bes8 f d:min c2. a4:min d4:min a d:min g8:min6 a d1:min
}

voiceA = \relative c'{
\clef "treble"
\key d \minor
\time 4/4
\partial 4

d8 e |
\repeat volta 2 {
f4 e d f8 g | a2. a8 c | d4 c4. d8 c f, | g2. c8 a | f4 e d e8 e | d2. d8 e
}
}

lyricA = \lyricmode {
Lai Tavs Gai -- šais Vaigs, Kungs un Dievs, vien -- mēr at -- spīd pār ma -- ni, Kungs, lai tā spī -- dums caur -- strā -- vo mūs. Lai Tavs...
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
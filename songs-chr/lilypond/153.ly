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
c2. a2:min d4:min g:7 c1 g2:7 c1 a2:min d4:min7 g:7 c1 g2:7 c
}

voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4

\repeat volta 2 {
\partial 4
g8 f | e4 e8 d | c4 d8 e | d4 b | c4. g8 | c e g a | g4 (f) |
e4 g8 f | e4 e8 d | c4 d8 e | d4 b | c4. g8 | c4 e | d d | c2
}
}

lyricA = \lyricmode {
Es vien -- mēr gri -- bu būt Kun -- ga Jē -- zus draugs un Vi -- ņam dzies -- mas dzie -- dāt.
Es vien -- mēr gri -- bu būt Kun -- ga Jē -- zus draugs un vien -- mēr Vi -- ņu lūgt.
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



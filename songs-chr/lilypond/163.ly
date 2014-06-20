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
a2:min d:min7 g c:maj7 f d:min6 e4.:sus4 e8 a2:min a:min d:min7 g c:maj7 f:maj7 d:min6 e a:min
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4

e8 e4 g8 f2 | d8 d4 f8 e2 | a8 a4 a8 b2 | b8 b4 b8 c4 c |
e,8 e4 g8 f2 | d8 d4 f8 e2 | a4 a b2 | gis a \bar"|."
}

lyricA = \lyricmode {
Lai ta -- va sirds vairs ne -- bai -- dās: Dievs te -- vi mīl, Viņš te -- vi iz -- glābs.
Lai ta -- va sirds vairs ne -- bai -- dās: uz -- ti -- cies Die -- vam.
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



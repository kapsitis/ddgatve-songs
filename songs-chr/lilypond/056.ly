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
d1.:min g2:min d2.:min c4 f1 d:min bes2. g2.:min f4 c4 d1:min
}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 4/4

f4 f8 f d [(f]) d4 | d e8 f a [(g]) g4 | f f8 f f4 g | a16 g a8~ a2. | f4 f8 f e [(f]) d4 | d'd8 d c [(d]) bes [(a]) | g4 g8 g f f e e | d1 \bar "|."
}

lyricA = \lyricmode {
Sal -- ve Re -- gi -- na, Sal -- ve Re -- gi -- na, Ma -- ter mi -- se -- ri -- cor -- di -- ae. Sal -- ve Re -- gi -- na, Sal -- ve Re -- gi -- na, Ma -- ter mi -- se -- ri -- cor -- di -- ae.
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


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
c1 d:min g c
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4

\repeat volta 2 { c4 c c8 c16 d e8 c | d4 d r2 | d4 d d8 d16 e f8 d | c4 c r2 }
}

lyricA = \lyricmode {
A -- ve, A -- ve Ma -- ri -- a. A -- men. A -- ve, A -- ve Ma -- ri -- a. A -- men.
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



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
s4 g1 d:7 d:7 g g d:7 d:7 g
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\repeat volta 2 {
\partial 4
\mark \markup {\circle \bold 1 }
b8 ([a]) | g4 d d g8 ([a]) | g4 fis2 a8 ([g]) | fis4 fis8 ([e]) d4 d8 c | b2.
\mark \markup {\circle \bold 2 }
d8 ([c]) | b4 d b'4. c8 | b4 a2 c8 ([b]) | a4 a8 ([g]) fis ([d]) b' a | g2. s4
}
}

lyricA = \lyricmode {
A -- ve Ma -- ri --a, a -- ve, a -- ve Ma -- ri -- a, a -- ve,
a -- ve Ma -- ri --a, a -- ve, a -- ve Ma -- ri -- a, a -- ve.
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



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

%chordsA = \chordmode {}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 2/4
\repeat volta 2 {
\mark \markup {\circle \bold 1 }
b4 b8 b | c4 c8 b | a2 | g \bar"||"
\mark \markup {\circle \bold 2 }
g4 g8 g | e4 fis8 g | g4 (fis) | g2 \bar"||"
\mark \markup {\circle \bold 3 }
d4 d8 d | e4 e8 d | d2 b }
}

lyricA = \lyricmode {
Dzie -- dā -- sim Kun -- gam ar prie -- ku.
Dzie -- dā -- sim Kun -- gam ar prie -- ku.
Dzie -- dā -- sim Kun -- gam ar prie -- ku.
}


fullScore = <<
%\new ChordNames { \chordsA }
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



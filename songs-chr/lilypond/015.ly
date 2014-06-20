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
\key d \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
a4 fis b a8 g \bar"||"
\mark \markup {\circle \bold 2 }
fis8 ([g]) a4 g8 ([fis] e4) \bar"||"
\mark \markup {\circle \bold 3 }
d1 \bar"||"
\mark \markup {\circle \bold 4 }
a'4 (d b) cis \bar"||"
\mark \markup {\circle \bold 5 }
d1 \bar"||"
\mark \markup {\circle \bold 6 }
fis,4 (d) d (e) \bar"||"
\mark \markup {\circle \bold 7 }
d1 \bar"||"
}

lyricA = \lyricmode {
Glo -- ri -- a, in ex -- cel -- sis De -- o, Glo -- ri -- a, Glo -- ri -- a.
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



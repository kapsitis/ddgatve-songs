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

voiceA = \relative c' {
\clef "treble"
\key f \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 3/4

\partial 4
\mark \markup {\circle \bold 1 }
f4 | bes2 bes4 | a2
\mark \markup {\circle \bold 2 }
a4 | g g g | c2 a4 | bes2 bes4 | a2 a4 | g g a8 ([g]) | f2 \bar"|."
}

lyricA = \lyricmode {
A -- ve, a -- ve, a -- ve Ma -- ri -- a, a -- ve, a -- ve, a -- ve Ma -- ri -- a.
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



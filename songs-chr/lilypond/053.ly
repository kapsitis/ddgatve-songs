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
\time 4/4

\mark \markup {\circle \bold 1 }
b4 a8 g e2 | fis4 e8 fis g2 \bar"||"
\mark \markup {\circle \bold 2 }
d4 d8 d e e fis g | a4 a g8 a b4 \bar"||"
\mark \markup {\circle \bold 3 }
b a8 g e2 | c'4 b8 a g2 \bar"||"
\mark \markup {\circle \bold 4 }
d'4 c8 b c b a g | fis2 g \bar"|."
}

lyricA = \lyricmode {
Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat a -- ni -- ma me -- a Do -- mi -- num.
Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat a -- ni -- ma me -- a.
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



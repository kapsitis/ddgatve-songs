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
\key es \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
g8 g g4 g8 g g4 | as8 as g f g4 g \bar"||"
\mark \markup {\circle \bold 2 }
c8 c g4 es8 es c4 | r8 f es f g4 r \bar"||"
\mark \markup {\circle \bold 3 }
c,8 c d d es r es4 | f8 ([es]) f4 d2 \bar"||"
\mark \markup {\circle \bold 4 }
es4 g c c | d8 (c b c) d2 \bar"|."
}

lyricA = \lyricmode {
Glo -- ri -- a, Glo -- ri -- a, in ex -- cel -- sis De -- o.
Glo -- ri -- a, Glo -- ri -- a, Al -- le -- lu -- ja!
et in ter -- ra pax ho -- mi -- ni -- bus
bo -- ne vo -- lun -- ta -- tis.
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



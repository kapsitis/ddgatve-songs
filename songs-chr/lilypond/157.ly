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
c2 f g c
c2 f g c
c2 f g c
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
e4 e8 e c4 c | d4 d8 d e2 \bar"||"
\mark \markup {\circle \bold 2 }
e4 e8 e f2 | g8 d e f e2 \bar"||"
\mark \markup {\circle \bold 3 }
g4 e c2 | g4 g c2 \bar"|."
}

lyricA = \lyricmode {
Pa -- sau -- le gai -- da, kad svē -- tie nāks.
Kur svē -- tie iet, tur ar vi -- ņiem Dievs.
E -- siet svē -- ti kā Dievs!
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



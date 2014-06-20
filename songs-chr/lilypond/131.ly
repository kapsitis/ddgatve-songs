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

\mark \markup {\circle \bold 1} 
g2^\markup {\translate #'(-11 . 0) \italic Kanons } g | as4 g f2 \bar"||"
\mark \markup {\circle \bold 2} 
es2 es | f4 es d2 \bar"||"
\mark \markup {\circle \bold 3} 
c2 es | f g \bar"||"
\mark \markup {\circle \bold 4}
c2 b4 c | d1 \bar"|."
}

lyricA = \lyricmode {
Ve -- ni Cre -- a -- tor, ve -- ni Cre -- a -- tor, ve -- ni Cre -- a -- tor spi -- ri -- tus.
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



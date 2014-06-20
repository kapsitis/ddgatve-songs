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
\key f \major
%\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 6/8


a8([^\markup {\translate #'(-2 . 0) \circle \bold 1 }
  g]) a bes4. | g8 ([f]) g a4. \bar"||"
d,4^\markup {\translate #'(-2 . 0) \circle \bold 2 } 
  d8 g ([a]) bes | c4. a \bar"||"
a8([^\markup {\translate #'(-2 . 0) \circle \bold 3 }
  d]) c bes4. | g8 ([c]) bes a4. \bar"||"
f8^\markup {\translate #'(-2 . 0) \circle \bold 4 }
  e f g4. | e d e f4 \bar"|."
}

lyricA = \lyricmode {
Glo -- ri -- a, Glo -- ri -- a, in ex -- cel -- sis De -- o!
Glo -- ri -- a, Glo -- ri -- a, Al -- le -- lu -- ja, Al -- le -- lu -- ja!
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



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
\key a \minor
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
c2 d | 
\mark \markup {\circle \bold 2 }
e4 c^\markup { \translate #'( -2 . 0 ) \italic Ju-bi... } c b |
\mark \markup {\circle \bold 3 }
c a g4. f8 | 
\mark \markup {\circle \bold 4 }
e4 (f) d2 |
\mark \markup {\circle \bold 5 }
c2 g4 g |
\mark \markup {\circle \bold 6 }
c2 r \bar"|."
}

lyricA = \lyricmode {
Ju -- bi -- la -- te De -- o, Ju -- bi -- la -- te De -- o, Al -- le -- lu -- ja.
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



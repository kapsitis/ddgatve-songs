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
a2:min g f e:min
a2:min g f e:min
a2:min g f e:min
a2:min g f e:min
}

voiceA = \relative c'' {
\clef "treble"
\key a \minor
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
a2 g | a e \bar"||"
\mark \markup {\circle \bold 2 }
a4 a b b | c d8 ([c]) b2 \bar"||"
\mark \markup {\circle \bold 3 }
e4 e d d | c d8 ([c]) b4 e, \bar"||"
\mark \markup {\circle \bold 4 }
a4 a g b | a1 \bar"|."
}

lyricA = \lyricmode {
Jē -- zu, Jē -- zu, Tu pie ma -- nis nāc ik -- brīd
va -- kar, šo -- dien, mū -- žī -- gi Tu sa -- vu mī -- lu sniedz.
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



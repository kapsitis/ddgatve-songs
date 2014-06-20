\version "2.13.16"
%\header {
%    title = "Kur tu teci, moza pele",Laivas lapas,Ziemassvētki
%}
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
\phrasingSlurDown
g'8 g g\( g\) |
g8 f e e |
f8 f g4 |
g8 g g4 |
g8 g g g |
g8 f e\( e\) |
f8 f g4 |
g8 g g4 |
\bar "|."
}

lyricA = \lyricmode {
 Kur tu te -- ci, mo -- za pe -- le, ka -- la -- dū, ka -- la -- dū?
 Da o -- rū -- dam zier -- ņu zog -- tu, ka -- la -- dū, ka -- la -- dū?
} 

fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



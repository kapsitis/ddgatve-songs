\version "2.13.16"
%\header {
%    title = "Dzīvoš ilgi nedzīvošu", AA lapas, bēres
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
g'8\fermata f e e |
f8 e e f |
g8 f e e |
\time 3/4
f8 f g2 |
\time 2/4
g8 e f f |
g8 f e e |
a8 g g f |
\time 3/4
e8 f g2 |
\time 2/4
f8 e f e |
\time 3/4
d8 d e2
\bar "|."
} 

lyricA = \lyricmode {
Dzī -- voš' il -- gi ne -- dzī -- vo -- šu, Sau -- les mū -- žu ne -- dzī -- voš',
dzī -- voš' il -- gi ne -- dzī -- vo -- šu, Sau -- les mū -- žu ne -- dzī -- voš',
Sau -- les mū -- žu ne -- dzī -- voš'.
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



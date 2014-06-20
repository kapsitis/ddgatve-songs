\version "2.13.16"
%\header {
%    title = "Baltaitiņa jūru brida",AA lapas, Jāņi
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
\key a \minor
\time 3/4
a8 b c4 a |
\time 2/4
d8 c d f |
\time 3/4
e8 d c[ d] e4 |
\time 2/4
d8 c d a |
c8 b a4 |
d8 c d a |
c8 b a4 |
\bar "|."
} 

lyricA = \lyricmode {
Balt -- ai -- ti -- ņa jū -- ru bri -- da, jū -- ru bri -- da,
dzel -- te -- nie -- mi na -- dzi -- ņiem, dzel -- ten -- ie -- mi na -- dzi -- ņiem.
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



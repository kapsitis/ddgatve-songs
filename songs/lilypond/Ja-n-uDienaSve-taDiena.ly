\version "2.13.16"
%\header {
%    title = "Jāņu diena svēta diena",AA lapas, Jāņi
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
\key d \minor
\time 2/4
d8 f e d |
d8 f e d |
\time 3/4
d4 a'2 |
e8[ f] g2 |
\time 2/4
g8 a e e |
f8 e d a |
\time 3/4
f'8[ e] d2\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Jā -- ņu die -- na svē -- ta die -- na, lī -- go, lī -- go,
par vi -- sā -- mi die -- ni -- ņā -- mi, lī -- go
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



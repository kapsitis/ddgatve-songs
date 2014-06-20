\version "2.13.16"
%\header {
%    title = "Vai tik vieni Saule spīd, kā pa logu istabā"
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
f8 d f f |
f8 e d4 |
f8 f f f |
f8 e d4 |
e8 d c c |
c8 c d4 |
d8 d d d |
d8 c d4 |
e8 d e d |
c8 c d4\fermata |
\bar "|."
} 


lyricA = \lyricmode {
Vai tik vie -- ni Sau -- le spīd, kā pa lo -- gu is -- ta -- bā,
vai tik vie -- ni Sau -- le spīd, kā pa lo -- gu is -- ta -- bā, kā pa lo -- gu is -- ta -- bā?
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




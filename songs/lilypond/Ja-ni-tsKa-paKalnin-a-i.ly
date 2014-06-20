\version "2.13.16"
%\header {
%    title = "Jānīts kāpa kalniņāi",AA lapas, Jāņi
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
e8 d c c |
g8 c c c | 
d8 d d f |
e8 d e4 |
e8 d c c |
g8 c c c | 
d8 d d d |
e8 d c4 |
f8 f f4 |
e8 c c4 |
d8 d d f |
e8 d e4 |
f8 f f4 |
e8 c c4 |
d8 g g g |
c,8 c c4 |
\bar "|."
} 

lyricA = \lyricmode {
Jā -- nīts kā -- pa kal -- ni -- ņā -- i,
zā -- ļu nas -- ta mu -- gu -- rā, 
Jā -- nīts kā -- pa kal -- ni -- ņā -- i,
zā -- ļu nas -- ta mu -- gu -- rā, 
mu -- gu -- rā, mu -- gu -- rā, zā -- ļu nas -- ta mu -- gu -- rā,
mu -- gu -- rā, mu -- gu -- rā, zā -- ļu nas -- ta mu -- gu -- rā
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



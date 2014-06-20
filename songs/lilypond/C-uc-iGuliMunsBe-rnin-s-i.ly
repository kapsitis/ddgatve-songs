\version "2.13.16"
%\header {
%    title = "Čuči, guli, muns bērniņši"
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
\time 4/4
\repeat volta 2 {
\set Score.repeatCommands = #'((volta ""))
d8^\markup{4 reizes} d d c e d c e | 
d8 d d c e d c r |
\set Score.repeatCommands = #'((volta #f))
}
\repeat volta 2 {
d8 d g e d f e e | 
d8 d g e d f e4 | 
d8 d c c d f e e |
d8 d c c d f e4 |
}
} 

lyricA = \lyricmode {
Ču -- či, gu -- li, muns bēr -- neņ -- ši
Kā pe -- lei -- te mi -- dze -- ņā. 
Ča -- pu, ča -- pu luo -- ča bārn -- si, 
O -- po -- lo -- mi kuo -- je -- ņom. 
Ča -- pu, ča -- pu luo -- ča bārn -- si, 
O -- po -- lo -- mi kuo -- je -- ņom. 
} 

lyricB = \lyricmode {
Na -- sa -- klau -- si cī -- ma gai -- ļu, 
Na -- mū -- dy -- noj muo -- mu -- leņ.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



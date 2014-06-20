\version "2.13.16"
%\header {
%    title = "Visi koki gauži rauda",AA lapas,bēru
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
e8 e d e |
f8 e d d |
d8 d c d |
e8 e e e |
e8 d c b |
\time 4/4
a4 e' d e |
\bar "|."
} 

lyricA = \lyricmode {
Vi -- si ko -- ki gau -- ži rau -- da, ru -- de -- nī -- ša gai -- dī -- da -- mi,
ru -- de -- nī -- ša gai -- dī -- da -- mi.
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



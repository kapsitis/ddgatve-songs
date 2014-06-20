\version "2.13.16"
%\header {
%    title = "Sasildiesi mūs māsiņa",AA lapas, bēres
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
f8 f d d |
e8 d d e |
f8 f d d | 
e8 d d4 |
f8 f f f |
d8 d f f |
d8 d f f |
f8 e d4 |
\bar "|."
} 

lyricA = \lyricmode {
Sa -- sil -- die -- si mūs mā -- si -- ņa, sa -- va tē -- va sil -- tu -- mā,
sa -- sil -- die -- si mūs mā -- si -- ņa, sa -- va tē -- va sil -- tu -- mā.
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



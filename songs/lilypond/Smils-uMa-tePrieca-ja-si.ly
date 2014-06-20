\version "2.13.16"
%\header {
%    title = "Smilšu māte priecājāsi",AA lapas, bēres
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
d4 f f8 e |
\time 2/4
d8 e e e |
d8 e f f |
g8 e f4 |
g8 e f f |
g8 f e4 |
\time 3/4
d4 f f8 e |
d8 d e2 |
\bar "|."
} 

lyricA = \lyricmode {
Smil -- šu mā -- te prie -- cā -- jā -- si, ka -- pu ma -- lu dan -- co -- jot,
smil -- šu mā -- te prie -- cā -- jās, ka -- pu ma -- lu dan -- co -- jot.
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



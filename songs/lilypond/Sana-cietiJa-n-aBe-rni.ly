\version "2.13.16"
%\header {
%    title = "Sanācieti Jāņa bērni",AA lapas, Jāņi
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
\repeat volta 2 {
\time 2/4
e8 g g g |
g8 e d e |
\time 3/4
f4 e2 |
}

\repeat volta 2 {
a4. f8 g a |
\time 2/4
g8 e d g |
\time 3/4
f4 e2 |
}
} 

lyricA = \lyricmode {
Sa -- nā -- cie -- ti, Jā -- ņa bēr -- ni, lī -- go, 
sa -- gai -- die -- ti Jā -- ņa die -- nu, lī -- go!
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



\version "2.13.16"
%\header {
%    title = "Visu gadu Jānits nāca",AA lapas, Jāņi
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
c8 g' g g |
f8 e d c |
\repeat volta 2 {
\time 2/4
c8[ e] g4 |
f8[ a] g4 |
e8 g g g |
f8 e d c |
\time 4/4
e8[ d] c2. |
}
} 

lyricA = \lyricmode {
Vi -- su ga -- du Jā -- nīts nā -- ca, lī -- go, lī -- go,
nu at -- nā -- ca šo -- va -- ka -- ri, lī -- go!
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



\version "2.13.16"
%\header {
%    title = "Div'svecītes jūra dega",AA lapas, Jāņi
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
c8 e d c |
e8 d c a |
\time 3/4 
a4 d2 |
\time 2/4
c4 d |
c8 e d c |
e8 d c a |
\time 3/4 
a4 d2 |
}
} 

lyricA = \lyricmode {
Div' sve -- cī -- tes jū -- rā de -- ga, lī -- go, lī -- go,
div' sud -- ra -- ba luk -- tu -- rī -- ši, lī -- go
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



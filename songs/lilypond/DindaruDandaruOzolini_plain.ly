\version "2.13.16"
%\header {
%    title = "Dindaru, dandaru, ozoliņi"
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
\key e \major
\time 2/4  \tempo 4=120
e4 e8 e | e4 e8 e | e4 e4 | fis4 b,4 |
b4 b8 b | b4 b8 b | b4 b4 | b4 b4 
\bar "|."
} 

lyricA = \lyricmode {
Din -- da -- ru, dan -- da -- ru, o -- zo -- li -- ņi, 
din -- da -- ru, dan -- da -- ru, o -- zo -- li -- ņi.
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



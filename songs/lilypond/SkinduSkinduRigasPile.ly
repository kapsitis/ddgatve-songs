\version "2.13.16"
%\header {
%    title = "Šķindu, šķindu Rīgas pile"
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
\key c\major
\time 2/4
\repeat volta 2 {
e8 c c c | e d d d | f b, b b | d c c4
}
} 


lyricA = \lyricmode {
Šķin-8 du,8 šķin-8 du8 Rī-8 gas8 pi-8 le,8 
ka-8 ķī-8 te-8 i8 dan-8 co-8 jot.4
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




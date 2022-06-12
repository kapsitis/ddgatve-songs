\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Šo celiņu rītā gāju",AA lapas, bēres
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
\repeat volta 2 {
c8 d e4 f |
g8 f e4 d |
c8 d e4 e |
d8 b c2
}
} 

lyricA = \lyricmode {
Šo ce -- li -- ņu rī -- tā gā -- ju, šo ce -- li -- ņu va -- ka -- rā.
}  

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



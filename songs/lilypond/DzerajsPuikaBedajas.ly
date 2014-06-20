\version "2.13.16"
%\header {
%    title = "Dzērājs puika bēdājās"
%}
% Budēlīši, p.102
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
\time 8/2
g'4. e8 a4 g8[ f] e4 d c c c' c d d c( b8) a g4 b | 
c4. e,8 f4 a g4. e8 c4 c g'4. e8 a4 g8[ f] e4 d c2 
\bar "|." 
} 

lyricA = \lyricmode {
Dzē -- rājs pui -- ka bē -- dā -- jā -- se, kur būs ņem -- ti lī -- ga -- vi -- ņu; 
Dzē -- rājs pui -- ka bē -- dā -- jā -- se, kur būs ņem -- ti lī -- ga -- viņ'.
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



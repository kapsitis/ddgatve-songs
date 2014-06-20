\version "2.13.16"
%\header {
%    title = "Zam ūzūla nasiedieju"
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


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
g8 g g g | a8 a g g | d8 f e d | c8 c c4 |
g'8 g g g | a8 a a a | b8 b b b | c8 c c4 |
\repeat volta 2 {
a4 f8 a | g4 g8 g | d'4 b8 b | c8 c c4
}
} 

lyricA = \lyricmode {
Zam ū -- zu -- la na -- sie -- die -- ju— za -- mi zo -- ri ū -- zu -- lam. 
Zam ū -- zu -- la na -- sie -- die -- ju— za -- mi zo -- ri ū -- zu -- lam. 
Rai ri -- di, rai ri -- di, rai ri -- di ral -- la lā.
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




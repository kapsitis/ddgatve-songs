\version "2.13.16"
%\header {
%    title = "Lec, Saulīte, rītā agri"
%}
% Spēka dziesmas; p.18
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
\key d \minor
\time 4/4
r2 r4 d8 f | e4 d8[ a] f'8 f f e | 
\time 3/4
d8 f e4 d |
\time 4/4
f8 f f e f4 e8[ d] | d2\fermata r2 
} 

lyricA = \lyricmode {
Lec, Sau -- lī -- te, rī -- tā ag -- ri, 
Spī -- di ma -- nā, spī -- di ma -- nā sē -- ti -- ņā.  
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



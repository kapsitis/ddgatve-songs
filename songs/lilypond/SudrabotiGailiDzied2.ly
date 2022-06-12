\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sudraboti gaiļi dzied"
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
Sud -- ra -- bo -- ti gai -- ļi dzie -- da zelt -- u -- pī -- tes,
zelt -- u -- pī -- tes ma -- li -- ņā. 
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



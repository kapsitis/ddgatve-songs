\version "2.13.16"
%\header {
%    title = "Kas tur spīda, kas tur mirdza"
%}
% 3x9 Jāņi; p.46
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
\time 3/4
\clef "treble"
\key e \minor
e8 g g4 e | a8 g fis4 e | e8 g g4 e | a8 g fis4 e | 
\time 2/4
g8 a g e | 
\time 4/4
g8 e4( fis8) g e4. 
\bar "|."
} 

lyricA = \lyricmode {
Kas tur spī -- da, kas tur mir -- dza, 
Kas tur spī -- da, kas tur mir -- dza, 
Di -- ža me -- ža ma -- li -- ņā -- i. 
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



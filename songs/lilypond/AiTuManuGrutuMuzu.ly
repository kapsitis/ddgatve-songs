\version "2.13.16"
%\header {
%    title = "Ai, tu manu grūtu mūžu"
%}
% Budēlīši, p.107
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
\key e \minor
\time 5/8 b'8 b e4 d8 | c8 b b4 b8 | 
b8 b b4 a8 | g8 fis e4. | 
g8 g a4 e16[ fis] | g8 fis e4.  
\bar "|." 
} 

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 5/8 s4. e8 fis16[ g] | a8 e g[ fis] e | 
g8 g fis4 fis8 | e8 g, b4. |
e8 d c4 a8 | b8 b e4. 
\bar "|." 
} 


lyricA = \lyricmode {
Ai, tu ma -- nu grū -- tu mū -- žu, 
kā es te -- vi no -- dzī -- voš'. 
Kā es te -- vi no -- dzī -- voš'. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



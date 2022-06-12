\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Vilks dara alu"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#39)
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
\time 3/4
\repeat volta 3 {
\phrasingSlurDashed
g'4 a g | f4 e4\( e4\) | g4 a g | f4 e2
\phrasingSlurSolid
}
\time 2/4
\repeat volta 2 {
g8 g g g | a8 a g f | g8 f e4 | e8 f g4 |
g8 g g g | a8 a g f | g8 f e4 | e8 f g4  
}
}

lyricA = \lyricmode {
Vilks da -- ra a -- lu _ nied -- rā -- ja ma -- lā, 
Vilks ar ka -- zu sa -- de -- rē -- ja, ka -- la -- dū, ka -- la -- dū, 
de -- vi -- ņā -- mi va -- sa -- rā -- mi, ka -- la -- dū, ka -- la -- dū,
} 

lyricB = \lyricmode {
Ai -- ci -- na ka -- zi -- ņas al -- ti -- ņu dzer -- ti,
Vilks ne -- gai -- da tri -- ju die -- nu, ka -- la -- dū, ka -- la -- dū,
Krīt ka -- za -- i mu -- gu -- rā -- i, ka -- la -- dū, ka -- la -- dū.
}

lyricC = \lyricmode {
Ne mū -- su ka -- zas, _ kai -- mi -- ņu ka -- zas.
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceA" \lyricB
\new Lyrics \lyricsto "voiceA" \lyricC
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



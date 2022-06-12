\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tur skan, kas tur žvadz"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#35)
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
\key d \major
\time 2/4
a'8 a a a a g fis g | 
a8 fis fis4 b8 a a4 |
a8 a a a a g fis g | a8 fis fis4 g8 g fis4\fermata
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key d \major
\time 4/4
fis8 fis fis fis fis e d e |
fis8 d d4 g8 fis fis4 |
fis8 fis fis fis fis e d e |
fis8 d d4 e8 e d4\fermata
}




lyricA = \lyricmode {
Kas tur ska -- na, kas tur žva -- dza, ka -- la -- dū, ka -- la -- dū, 
Zie -- mas -- svēt -- ki, tie tur žva -- dza, ka -- la -- dū, ka -- la -- dū.
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



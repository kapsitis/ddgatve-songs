\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pūti, pūti ziemelīti"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#42)
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
\repeat volta 2 {
r2 | b'8 b a a | a8 g fis4 | e8 e fis4
}
}

lyricA = \lyricmode {
Pū -- ti, pū -- ti, zie -- me -- lī -- ti, ka -- la -- dū, ka -- la -- dū, 
} 

lyricB = \lyricmode {
Dzen sud -- ra -- bu šai ze -- mē -- i, ka -- la -- dū, ka -- la -- dū. 
} 


voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
d8 d e fis | g8 g fis fis | fis8 e d4 | a8 a d4
}
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
\new Lyrics \lyricsto "voiceB" \lyricB
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



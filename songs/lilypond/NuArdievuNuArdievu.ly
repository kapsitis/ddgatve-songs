\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nu ardievu, nu ardievu"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#43)
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#34)

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
\time 2/4
\repeat volta 2 {
d8 a' a a | g16[ a] bes8 a a | g16[ a] bes8 a a | g16[ f] e8 d4  
}
\repeat volta 2 {
c'4. d16[ c] | bes8 bes bes bes | a8 c c4 | d8 d d d | d8 a d4
}
}

lyricA = \lyricmode {
Nu ar -- die -- vu, nu ar -- die -- vu,  šī va -- ka -- ra sai -- me -- niec'.
Ē -- ē, i -- li -- li -- li -- ī -- da -- dā, da -- kā da -- kā da -- la -- lā. 
} 

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\repeat volta 2 {
d8 f f f | e16[ f] g8 f f | e16[ f] g8 f f | g16[ f] e8 d4  
}
\repeat volta 2 {
a'4. bes16[ a] | g8 g g g | f8 a a4 | d,8 f a a | g16[ f] e8 d4
}
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



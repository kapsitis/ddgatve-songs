\version "2.13.16"
%\header {
%    title = "Sen dzirdēju, nu redzēju"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#41)
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

chordsA = \chordmode {
\time 2/4
d2:5 | g2:5 | a2:5 | d2:5 |   
d2:5 | g2:5 | a2:5 | d8:5 a8:5 d4:5 |
}


voiceA = \relative c' {
\clef "treble"
\key d \major 
\time 2/4 
\oneVoice
fis8 fis16[ e] d8. fis16 
\voiceOne 
g8 fis e8. d16 |
cis8 e e e | 
a8 b a8. g16 |
fis8 fis16[ e] d8. fis16 | 
g8 fis e8. d16 |
cis8 e a8. g16 | 
fis8 e d4
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key d \major 
\time 2/4 
s2 |
e8 d e8. d16 |
cis8 e e e | 
d8 d fis8. e16 | 
d8 d16[ e] d8. d16 | 
e8 d e8. d16 | 
cis8 cis a8. cis16 | 
d8 a d4
\bar "|." 
} 


vardiBalssA = \lyricmode {
Sen dzir -- dē -- ju, nu re -- dzē -- ju Zie -- mas -- svēt -- ku ku -- me -- li -- ņu,
sen dzir -- dē -- ju, nu re -- dzē -- ju Zie -- mas -- svēt -- ku ku -- me -- liņ'.
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \vardiBalssA
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



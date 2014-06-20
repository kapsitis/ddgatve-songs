\version "2.13.16"
%\header {
%    title = "Ziemassvētki sabraukuši"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#36)
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
\key a \major
\time 2/4
cis'8. a16 b8. gis16 a8 e e e | fis8 a e8. cis16 d8 b a4 
\repeat volta 2 {
e'8. e16 e4 a8. a16 a4 | cis8. a16 b8. gis16 a8 a a4
}
}

voiceB = \relative c' {
\clef "treble"
\key a \major
\time 4/4
a'8. fis16 e8. e16 e8 cis cis cis | 
d8 b cis8. a16 b8 b a4 
\repeat volta 2 {
a8. a16 b4 cis8. cis16 d4 | e8. e16 e8. e16 a,8 a a4  
} 
}




lyricA = \lyricmode {
Zie -- mas svēt -- ki sa -- brau -- ku -- ši
rak -- stī -- tā -- mi ka -- ma -- nām. 
Tid -- ral -- lā, tid -- ral -- lā, rak -- stī -- tā -- mi ka -- ma -- nām.
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



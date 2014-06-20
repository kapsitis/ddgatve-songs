\version "2.13.16"
%\header {
%    title = "Pūti, pūti, ziemelīti"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#37)
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
d8 e f f | g f e d | <<f8 a>> <<e a>> <<f4 a>>  | <<f8 a>> <<e a>> <<f4 a>> 
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d2~ | d2 | s2 | s2 
}

voiceC = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
s2 | s2 | d8 c d4 | d8 c d4
}




lyricA = \lyricmode {
Pū -- ti, pū -- ti, zie -- me -- lī -- ti, ka -- la -- dū, ka -- la -- dū
} 

lyricB = \lyricmode {
Ē...
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Voice = "voiceC" { \voiceTwo \autoBeamOff \voiceC }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceB" \new Lyrics \lyricB
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



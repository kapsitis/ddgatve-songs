\version "2.13.16"
%\header {
%    title = "Bambadi - Lūdzama, māmiņa"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#40)
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
s2 | s2 \bar "||"
d8 d16 d fis8 fis16 fis | g8 fis16 fis e8 d16 d | d8 d fis4 | e8 e d4
\repeat volta 2 {
fis8 fis16 fis a8 a16 a | b8 a16 a g8 fis16 fis | fis8 fis a4 | g8 g fis4
}
}

voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 d16 d d8 d16 d | d8 d16 d d8 d16 d | d8 d16 d d8 d16 d | s2 | s2 | s2 
\repeat volta 2 {
d8 d16 d fis8 fis16 fis | g8 fis16 fis e8 d16 d | d8 d fis4 | e8 e d4
}
}

lyricA = \lyricmode {
Lū -- dza -- ma, mā -- mi -- ņa, laid bēr -- nus iek -- šā -- ja, ka -- la -- dū, ka -- la -- dū, 
Ķe -- ka -- tas at -- brau -- ca ar ve -- zu -- mi -- ņi -- se, ka -- la -- dū, ka -- la -- dū.
} 

lyricB = \lyricmode {
Bam -- ba -- di, bam -- ba -- di, bam -- ba -- di, bam -- ba -- di, bam -- ba -- di, bam -- ba -- di...
} 



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



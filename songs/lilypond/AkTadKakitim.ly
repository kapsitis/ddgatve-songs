\version "2.13.16"
%\header {
%    title = "Ak tad kaķītim"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#38)
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
\key g \major
\time 4/4
g'8 d e b d4 d | g8 a16 g fis8 e d4 d | g8 d e b d4 d | 
g8 a16 g fis8 e d2 | g4 b8 g b2 | a8 d16 c b8 b a a g4\fermata
\bar "|."
}

lyricA = \lyricmode {
Ak tad ka -- ķī -- ti -- mi, ak ta -- da bērns no -- mi -- ra, 
ak tad zie -- mas svēt -- ku, ak ta -- da va -- ka -- rā. 
Trā -- ral -- lal -- lā, trā -- ri -- di -- ri -- di ral -- lal -- lā. 
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



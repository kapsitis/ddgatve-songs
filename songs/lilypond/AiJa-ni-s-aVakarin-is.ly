\version "2.13.16"
%\header {
%    title = "Ai, Jānīša vakariņis"
%}
% Katrīna Riekstiņa, #44 (Grodi)
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
d8 d d f | 
g8 a f16[ e] d8 | 
f4 e | 
d4 a' 
\repeat volta 2 {
g8 g g16[ a] bes8 | 
a8 f e d | f4 e 
}
\alternative { { d4 a' } { f4\fermata e\fermata} }
} 

lyricA = \lyricmode {
Ai, Jā -- nī -- ša va -- ka -- ri -- ņis, 
lī -- go, lī -- go, 
o -- zo -- li -- ņa tē -- rē -- tā -- jis, 
lī -- go, lī -- go, 
lī -- go.
}

chordsA = \chordmode {
\time 2/4
d2:m | d2:m | d2:m | d4:m a4:m |
\repeat volta 2 {
g2:m | a2:m | d2:m |
}
\alternative { { d2:m } { d4:m a4:m } }
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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




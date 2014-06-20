\version "2.13.16"
%\header {
%    title = "Saule grieza zelta riņķi"
%}
% Katrīna Riekstiņa, #49 (Grodi)
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
\time 4/4
c8 d e e f e d c | 
c8 e e e f e d c | 
c8[ d] e4 d c |
d8 d e d d c c4\fermata 
\bar "|."
} 




lyricA = \lyricmode {
Sau -- le grie -- za zel -- ta riņ -- ķi
Jā -- ņa tē -- va pa -- gal -- mā -- i, 
lī -- go, lī -- go, 
Jā -- ņa tē -- va pa -- gal -- mā.  
}

chordsA = \chordmode {
\time 4/4
c1:5 | c1:5 | c2:5 g2:5 | g2:5 c2:5 |
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




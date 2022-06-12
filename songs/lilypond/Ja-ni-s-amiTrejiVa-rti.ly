\version "2.13.18"
#(ly:set-option 'crop #t)

% \header {
%    title = "Jānīšami treji vārti"
% }
% Katrīna Riekstiņa, #57 (Grodi)
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
\time 4/4
f8 e d e f e d e |
\time 5/4
f4 e4.( fis8) g4 d | 
\repeat volta 2 {
\time 4/4
g8 g fis fis g g fis e |
}
\alternative { { f4 e g d } { f e\fermata d e\fermata } }
} 


lyricA = \lyricmode {
Jā -- nī -- ša -- mi tre -- ji vār -- ti, 
lī -- go, lī -- go,
visi tre -- ji ap -- puš -- ķo -- ti, 
lī -- go, lī -- go, 
lī -- go, lī -- go.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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



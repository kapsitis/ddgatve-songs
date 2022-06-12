\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kādi ziedi rudzīšami"
%}
% Katrīna Riekstiņa, #43 (Rasa)
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
\key a \minor
\time 4/4
a'8 a a g c bes a a |
a8 a a g c bes a a | 
a4 f g e8( f) |
g4 a g g | 
\time 2/4
a8 f e4 |
d8( a'8) a4\fermata
\times 2/3 { g8[ c bes] } a4\fermata 
\bar "|."
} 

lyricA = \lyricmode {
Kā -- di zie -- di ru -- dzī -- ša -- mi, 
pe -- lēk -- zie -- di ru -- dzī -- ša -- mi,
pe -- lēk -- zie -- di ru -- dzī -- ša -- mi,
ru -- dzī -- šam, 
ro -- tā, ro -- tā. 
}

chordsA = \chordmode {
\time 4/4 
a1:m | a1:m | a1:m | e1:m |
\time 2/4
e2:m | e2:m | e4:m a4:m
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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




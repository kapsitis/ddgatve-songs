\version "2.13.16"
%\header {
%    title = "Ai, Jānīti, Dieva dēls"
%}
% Katrīna Riekstiņa, #46 (Grodi)
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
e8 e d e e d c c | e8 d c e e d c c 
\time 2/4
e4 e\fermata | <<d4 f>> e\fermata  
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
s1 | s1 
\time 2/4
c4 c | b4 c
} 


lyricA = \lyricmode {
Ai, Jā -- nī -- ti, Die -- va dēl -- si, 
Ta -- vu stal -- tu au -- gu -- mi -- ņu, 
lī -- go, lī -- go. 
}

chordsA = \chordmode {
\time 4/4
c1:5 | c1:5 |
\time 2/4
c2:5 | g4:5 c4:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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




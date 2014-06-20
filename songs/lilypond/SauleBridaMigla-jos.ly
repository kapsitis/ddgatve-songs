\version "2.13.16"
%\header {
%    title = "Saule brida miglājos"
%}
% Katrīna Riekstiņa, #50 (Iļģi)
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
d8. d16 d8 d d c c c | 
c4 d c d\fermata | 
d8. d16 d8 d d c c c 
\time 2/4
c4 d\fermata
\time 4/4
fis8. fis16 fis8 fis fis e e e | 
e4 fis e fis |
fis8. fis16 fis8 fis fis e e e | 
\time 2/4
e4 fis\fermata
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
s1 | s1 | s1 
\time 2/4
s2 
\time 4/4
d8. d16 d8 d d c c c | 
c4 d c d | 
d8. d16 d8 d d c c c | 
\time 2/4
c4 c
\bar "|."
} 

lyricA = \lyricmode {
Sau -- le bri -- da mig -- lā -- jo -- si,
lī -- go, lī -- go,
Jā -- ņu die -- nas va -- ka -- rā -- i,
lī -- go, 
Sau -- le bri -- da mig -- lā -- jo -- si,
lī -- go, lī -- go,
Jā -- ņu die -- nas va -- ka -- rā -- i,
lī -- go.
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




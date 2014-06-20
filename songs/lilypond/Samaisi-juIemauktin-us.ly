\version "2.13.16"
% \header {
%    title = "Saimaisīju iemauktiņus"
% }
% Katrīna Riekstiņa, #60 (Grodi)
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
e8\fermata c e g g16[ f] e8 d c 
\repeat volta 2 {
c8[ e] g4 f8[ e] e4 | 
g8 g g e f e d c 
\time 2/4
e8[ d] c4\fermata
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
s1 |
\repeat volta 2 {
s2 d8[ c] c4
e8 e e c d c b c | 
\time 2/4
c8[ b] c4
}
} 



lyricA = \lyricmode {
Sa -- mai -- sī -- ju ie -- mauk -- ti -- ņus, 
lī -- go, lī -- go, 
me -- tu ce -- ļa ma -- li -- ņā -- i, 
lī -- go. 
}

chordsA = \chordmode {
\time 4/4 
c1:5 | c2:5 f4:5 c4:5 | c1:5 |
\time 2/4
g4:5 c4:5
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



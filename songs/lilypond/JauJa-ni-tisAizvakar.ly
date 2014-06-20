\version "2.13.16"
%\header {
%    title = "Jau Jānītis aizvakar"
%}
% "Visi gaida jāņu dienu", 163.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 2/4 
e8 e e e | e8 d d d | g4 g | fis8[ e] e4 |
e8 e e e | e8 d d d | 
\time 3/4
g4 g2 | g8[ fis] e2 
\bar "|." 
} 


lyricA = \lyricmode {
Jau Jā -- nī -- tis aiz -- va -- ka -- ri, lī -- go, lī -- go, 
No Vāc -- ze -- mes iz -- rei -- zo -- ja, lī -- go, lī -- go!
}


voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4 
e8 e e e | e8 d d d | d4 d | d8[ e] e4 |
e8 e e e | e8 d d d | 
\time 3/4
d4 d2 | d4 e2 
\bar "|." 
} 

chordsA = \chordmode {
\time 2/4
c2:5 | 
\time 3/4
c4:5 f4:5 c4:5 | 
\time 2/4
c2:5 | 
\time 3/4
g4:5 c2:5 |
\time 2/4
g4:5 f4:5 |
c2:5 |
\time 3/4
c2.:5 | g4:5 c2:5 |
\time 2/4
g4:5 f4:5 |
c2:5 |
\time 3/4
c2.:5 | g4:5 c2:5 |
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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

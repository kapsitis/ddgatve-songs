\version "2.13.16"
%\header {
%    title = "Tā sacīja, tā bij' tiesa"
%}
% Katrīna Riekstiņa, #54 (Iļģi)
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
g'8\fermata fis16[ g] fis8 e d e e4 |
e8 d fis e e d d fis 
\time 2/4
e4 d\fermata
\time 4/4
g8 fis16[ g] fis8 e d e e4 |
e8 d fis e e d d fis 
\time 2/4
e4 d
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key g \major
\time 4/4
s1 | s1 
\time 2/4
s2
\time 4/4
d2~ d2~ | d1 
\time 2/4
c4 d
\bar "|."
} 

lyricA = \lyricmode {
Tā sa -- cī -- ja, tā bij' ties', ī -- sa bi -- ja Jā -- ņu nak -- te, lī -- go. 
Tā sa -- cī -- ja, tā bij' ties', ī -- sa bi -- ja Jā -- ņu nak -- te, lī -- go. 
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




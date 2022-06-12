\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Visu gadu naudu krāju"
%}
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



%voiceA = \relative c' {
%\clef "treble"
%\key g \major
%\time 2/4
%g'8 d d d | g8 d d d |
%g8 fis \grace {\stemDown e8} e4 |
%g8 fis \grace {\stemDown e8} e4 |
%g8 e e e | e8 d e4 |
%g8 e e4 | e8 d e4\fermata |
%e8 r r4
%\bar "|."
%} 

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 d d d | g8 d d d |
fis8 e d4 | fis8 e d4 |
g8 d d d | d8 c d4 |
fis8 d d4 | d8 c d4\fermata |
d8 r r4
\bar "|."
} 


lyricA = \lyricmode {
Vi -- su  ga -- du  nau -- du krā -- ju, 
O -- li -- lo, o -- li -- lo! 
Zie -- mas  svēt -- ku gai -- dī -- dams, 
o -- li -- lo, o -- li -- lo -- ja! 
}



fullScore = <<
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




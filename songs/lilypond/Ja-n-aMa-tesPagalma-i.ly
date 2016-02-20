\version "2.13.16"
%\header {
%    title = "Jāņa mātes pagalmāi"
%}
% 
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
\time 2/4
d8 d d e | f8 e d d | d4 e | e8[ f] g4 | f8 e f f | g8 f e d | e4 f | e4 d |
d8 d d e | f8 e d d | d4 e | e8[ f] g4 | f8 e f f | g8 f e d | e4 f4 | e4 d 
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2 | 
d8 d d d | d8 d d d | d4 c | c4 c | d8 d d d | d8 d d d | c4 d | c4 d
\bar "|."
}

lyricA = \lyricmode {
Jā -- ņa mā -- tes pa -- gal -- mā -- i, 
lī -- go, lī -- go,
Trīs sid -- ra -- ba a -- vo -- ti -- ņi, 
lī -- go, lī -- go!
Jā -- ņa mā -- tes pa -- gal -- mā -- i, 
lī -- go, lī -- go,
Trīs sid -- ra -- ba a -- vo -- ti -- ņi, 
lī -- go, lī -- go!  
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




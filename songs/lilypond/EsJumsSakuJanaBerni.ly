\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es jums saku Jāņa bērni"
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


voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8^"lēni, mierīgi" d g g | a8 g f e | f8( e) d4\fermata | f8( g) a4\fermata |
\repeat volta 2 {
g8 g g g | a8 g f e | f8( e) d4\fermata
} 
\alternative { { f8( g) a4\fermata } { \oneVoice r2 } }
} }


voiceB = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
s2*3 | f8( g) f4\fermata |
\repeat volta 2 {
e8 e e e | f8 d d cis | d8( cis) d4\fermata
} 
\alternative { { d8( e) d4\fermata } { s2 } }
} }


vardiBalssA = \lyricmode {
Es jums sa -- ku, Jā -- ņa bēr -- ni, lī -- go, lī -- go, 
Me -- tat ko -- kus no  ce -- li -- ņa, lī -- go, lī -- go.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \vardiBalssA
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



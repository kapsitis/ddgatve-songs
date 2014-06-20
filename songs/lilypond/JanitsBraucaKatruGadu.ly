\version "2.13.16"
%\header {
%    title = "Jānīts brauca katru gadu"
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


voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4
g8 g a a | c8 b a a | g4 c\fermata | a4 c\fermata |
d8 b c c | c d c a | bes4 a\fermata | g4 c\fermata | a4 c\fermata |
d8 b c c | c d c a | bes4 a\fermata 
\bar "|."
} 

lyricA = \lyricmode {
Jā -- nīts brau -- ca kat -- ru ga -- du, 
lī -- go, lī -- go!
At -- ved zā -- ļu ve -- zu -- mi -- ņu, 
lī -- go, lī -- go, lī -- go!
At -- ved zā -- ļu ve -- zu -- mi -- ņu, lī -- go!
}

voiceB = \relative c'' {
\clef "treble"
\key g \major
\time 2/4
g8 g a a | a8 g a a | g4 a\fermata | a4 a\fermata |
a8 g a a | a a a a | g4 a\fermata | g4 a\fermata | a4 a\fermata |
a8 g a a | a a a a | g4 a\fermata 
\bar "|."
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



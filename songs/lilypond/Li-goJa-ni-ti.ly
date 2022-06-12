\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Līgojam, līgojam"
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


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/2
\slurDown
g'4 e8( e) g4 c,8 c d4 d8 d c4 c8( c) |
f4 f8 f g4 e8( e) d4 g8 f e4 e 
\bar "|."
} 


lyricA = \lyricmode {
Lī -- go, Jā -- nī -- ti, ne -- gu -- li nak -- ti! 
Ne -- gu -- li Rī -- gā, ne Jel -- ga -- vā -- i. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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



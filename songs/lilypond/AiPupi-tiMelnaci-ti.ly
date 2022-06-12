\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, pupīti, melnacīti",AA lapas, Jāņi
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
\key d \minor
\time 2/4
f8 f f f |
f8 e d c |
\time 3/4
e4 d2 |
e4 f2 |
\time 2/4
f8 f f f |
f8 e d c |
\time 3/4
e4 d2 |
d4. c8 c c |
\time 2/4
c8 c c c |
\time 3/4
c4 d2 |
c4 d2 |
d4. d8 d d |
\time 2/4
c8 c c c |
\time 3/4
e4 d2 |
\bar "|."
} 

lyricA = \lyricmode {
Ai, pu -- pī -- ti, meln -- a -- cī -- ti, lī -- go, lī -- go, ta -- vu skais -- tu vai -- na -- dzi -- ņu, lī -- go!
Ai, pu -- pī -- ti, meln -- a -- cī -- ti, lī -- go, lī -- go, ta -- vu skais -- tu vai -- na -- dzi -- ņu, lī -- go!
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



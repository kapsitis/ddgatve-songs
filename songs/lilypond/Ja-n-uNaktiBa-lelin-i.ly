\version "2.13.16"
%\header {
%    title = "Jāņu nakti bāleliņi" Jāni, Laiva
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
\repeat volta 2 {
\time 2/4
c8 g' g g |
g8 f f g |
\time 5/4
a8[ g f g a f] g2 |
}
\repeat volta 2 {
\time 2/4
g8 g b b |
a8 f g g |
g4 b |
a8[ f] g4 |
}
\repeat volta 2 {
\time 2/4
g8 g a g |
g8 f f g |
\time 3/4
a4 g2 |
g4 f2 |
}
}

lyricAA = \lyricmode {
Jā -- ņu nak -- ti, bā -- le -- li -- ņi, lī -- go, 
Jā -- ņu nak -- ti, bā -- le -- li -- ņi, lī -- go, lī -- go, 
pie -- gu -- ļā -- i ne -- jā -- ja -- ti, lī -- go, lī -- go.
} 

lyricAB = \lyricmode {
pie -- gu -- ļā -- i ne -- jā -- ja -- ti, lī -- go, 
pie -- gu -- ļā -- i ne -- jā -- ja -- ti, lī -- go, lī -- go, 
pie -- gu -- ļā -- i ne -- jā -- ja -- ti, lī -- go, lī -- go.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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



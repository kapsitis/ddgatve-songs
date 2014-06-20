\version "2.13.16"
%\header {
%    title = "Burbuļaina upe teka",AA lapas, bēres
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
\key a \minor
\time 2/4
d8 d d c |
\time 4/4
e4 d c4. d8 |
\time 2/4
e8 e d e |
\time 4/4
f8[ d] e[ c] d4 c4 |
\time 2/4
c8 f e f |
\time 4/4
e4 d c2 |
\bar "|."
} 

lyricA = \lyricmode {
Bur -- bu -- ļai --  na u -- pe te -- ka, bur -- bu -- ļai -- na u -- pe te -- ka,
no kal -- ni -- ņa le -- ji -- ņā.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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



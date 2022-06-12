\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Maziņos putniņus Vējmāte šūpo",AA lapas
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
\time 2/4
\repeat volta 2 {
g8 c16 c c4 |
b8 d16 d d4 |
b8 d d b16 b16 |
d8 c c4 |
}
\repeat volta 2 {
f8 a a f |
e8 g g e |
d8 f f d |
d8 c c4 |
}
} 

lyricA = \lyricmode {
Pe -- lī -- te brauc, ra -- ti -- ņi čīkst,
pil -- nu mai -- si -- ņu mie -- ga ved.
Šim sau -- ji -- ņa, tam sau -- ji -- ņa, ma -- za -- ja -- mi riek -- ša -- viņ'.
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



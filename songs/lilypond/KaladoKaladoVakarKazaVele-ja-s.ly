\version "2.13.16"
%\header {
%    title = "Kaldo, kalado, vakar kaza velējās",AA lapas
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

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 |
g2:5 | c2:5 | f2:5 | c2:5 |
g2:5 | c2:5 | f2:5 | c8:5 g8:5 c4:5 |
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\repeat volta 2 {
\time 2/4
e8 f g4 |
e8 f g4 |
g8 a g f |
e8 d c4 |
}
d8 d d d | 
e8 e e e |
f8 f f4 |
e8 d e4 |
d8 d d d |
e8 e e e |
f8 f f4 |
e8 d c4 |
\bar "|."
} 

lyricA = \lyricmode {
Ka -- la -- do, ka -- la -- do, va -- kar ka -- za ve -- lē -- jās.
Vai pret sņī -- gim, vai pret ļī -- tim, ka -- la -- do, ka -- la -- do,
vai pret so -- vīm pre -- ci -- ņī -- kim, ka -- la -- do, ka -- la -- do!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



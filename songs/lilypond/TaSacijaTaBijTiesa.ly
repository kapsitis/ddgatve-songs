\version "2.13.16"
%\header {
%    title = "Tā sacīja, tā bij tiesa"
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


voiceA = \transpose b c' { \relative c' {
\clef "treble"
\key b \major
\time 3/4
e4.\fermata dis16[ e] dis8 cis \time 2/4
b8 cis cis r |
cis8 b dis cis |
cis b b dis |
cis4 b\fermata
\bar "|."
} }

lyricA = \lyricmode {
Tā sa -- cī -- ja, tā bij' ties', ī -- sa bi -- ja Jā -- ņu nak -- te, lī -- go. 
}

chordsA = \chordmode {
\time 3/4
d2.:m | 
\time 2/4
a2:m | d2:m | d2:m | d4:m a4:m |
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



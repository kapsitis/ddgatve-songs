\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.42
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
g'8 g g g | g g g g | \time 3/4 g [b] c2 | \time 2/4 b8 [a] c [a] |
\repeat volta 2 { \time 2/4  g g g g a g a f | \time 3/4 e [f] g2 | d4 c2 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Sit, Juo -- nei -- ti, va -- ra bun -- gas, lei -- gū, lei -- gū,
vuor -- tu sto -- ba ga -- le -- ņā -- i, lei -- gū, lei -- gū.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA

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



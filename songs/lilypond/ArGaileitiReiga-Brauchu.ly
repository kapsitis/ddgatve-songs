\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.13
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
g'4. g8 a g | \time 2/4 g f e f | \time 3/4 g4. g8 a g | \time 2/4 g f e4 |
d8 d f f | e e e e | d d f f | e f g4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ar gai -- lei -- ti Rei -- gā brau -- ču treis zēr -- nei -- ši va -- zu -- mā.
Ar gai -- lei -- ti Rei -- gā brau -- ču treis zēr -- nei -- ši va -- zu -- mā.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



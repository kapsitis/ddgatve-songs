\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.146
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 5/8
g8 g g [f] e | d f e4 e8 | g g g [f] e | d f e4 e8 |
d d d4 e8 | f f e4. | e8 e e [d] e | f f e4. \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Zem -- li zvaig -- znei -- te puor -- guo -- ja, zem -- li zvaig -- znei -- te puor -- guo -- ja
pa tū mī -- žu lei -- du -- meņ, pa tū mī -- žu lei -- du -- meņ.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



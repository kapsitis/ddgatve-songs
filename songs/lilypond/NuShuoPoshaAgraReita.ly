\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.144
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
c4 e e8 c | d4 f f8 d | e4 g g8 g | \time 4/4 a4 g g4. e8 |
\time 3/4 f4 a a8 f | e4 g g8 e | d4 g g8 f | \time 4/4 e4 d c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Nu šo po -- ša ag -- ra rei -- ta šķei -- rēs muo -- te tovs dē -- leņ -- ši,
nu šo po -- ša ag -- ra rei -- ta šķei -- rēs muo -- te tovs dē -- leņš.
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



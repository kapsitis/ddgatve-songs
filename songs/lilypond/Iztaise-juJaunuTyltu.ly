\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.51
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
  g'8 e f f | g g a a | g g f f | e e e4 |
  g8 [e] f4 | g8 g a4 | g8 e f f | e e e4 \bar"|."
}

lyricA = \lyricmode {
  \set stanza = "1. "
Iz -- tai -- sē -- ju jau -- nu tyl -- tu nu va -- ci -- mi dal -- de -- ri,
ai -- jā, ai -- ja -- jā, nu va -- ci -- mi dal -- de -- rim.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA"  \lyricA
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



\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.91
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
e8 e d b | c c d d | e e d d | a a a4 |
e'8 e16 e d8 [b] | c c16 c d4 | e8 e d d | a a a4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pyr -- mū -- diņ da pyr -- mū -- di -- ņu kūk -- li ne -- šu sē -- te -- ņā.
Ei, da -- ļu -- ļi, ei, da -- ļu -- ļi, kūk -- li ne -- šu sē -- te -- ņā.
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



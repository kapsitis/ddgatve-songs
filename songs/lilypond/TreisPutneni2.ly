\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.74b
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
a'8 a a g | bes bes bes a | g g g bes | a a a g |
f f f4 | g8 g g4 | e8 e a g | f f f4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Treis put -- ne -- ni skaiš -- ki dzī -- de smol -- ku loz -- du kryu -- me -- ņā -- i,
oi, oi, oi, tra -- la -- lā! smol -- ku loz -- du kryu -- me -- ņā.
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



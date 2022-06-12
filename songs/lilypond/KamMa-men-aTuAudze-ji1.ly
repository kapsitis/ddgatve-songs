\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.100
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 3/4
\phrasingSlurDashed
a4. a8 a c | \time 2/4 bes a g \(g\) | bes a bes d | \time 4/4 c4 bes a2 |
\time 3/4 c4. c8 c c | \time 2/4 d c bes a | g a bes d | \time 4/4 c4 bes a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kam, mā -- me -- ņa, tu au -- dzē -- ji za -- ļu bēr -- zi po -- gol -- mā.
Kam, mā -- me -- ņa, tu au -- dzē -- ji za -- ļu bēr -- zi po -- gol -- mā.
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



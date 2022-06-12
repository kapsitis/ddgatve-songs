\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.67
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/4
g'8 a b4 b | c8 b a4 a | a8 b c4 b | c8 b d [c] b4 |
g8 a b4 b | c8 b a4 a | a8 b c4 b | c8 b a4 g \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kam, mā -- me -- ņa, tu au -- dzē -- ji za -- ļu bier -- zi po -- gol -- mā -- i?
Kam, mā -- me -- ņa, tu au -- dzē -- ji za -- ļu bier -- zi po -- gol -- mā -- i?
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



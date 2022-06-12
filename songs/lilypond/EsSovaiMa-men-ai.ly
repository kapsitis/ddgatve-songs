\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.128
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4 
g4 g | a8 g fis e | d4 b | b' b |
c8 b a g | d'4 b | b a8 [b] | g g fis g |
a4 d, | b' a8 [b] | g g fis e | d4 b \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Es so -- va -- i mā -- me -- ņa -- i, es so -- va -- i mā -- me -- ņa -- i
ni -- ko lo -- ba na -- da -- rē -- ju, ni -- ko lo -- ba na -- da -- rē -- ju.
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



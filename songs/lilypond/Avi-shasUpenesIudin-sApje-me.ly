\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.110
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key es \major
\time 2/4
\slurDashed
f8 (f) f as | g (g) g g | f (es) d es | f4 f |
f f8 as | g g g g | f (es) d es | f4 f \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
A -- vī -- šas, u -- pe -- nes iu -- diņs ap -- jē -- me,
ai, ļu -- vai, ļu -- vai, ļu -- vai iu -- diņs ap -- jē -- me.
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



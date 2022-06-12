\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.62
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 2 {
c4 d e4. d8 | c4 d e2 | \time 2/4 e8 e f e | d d e e |
e e f e | \time 4/4 d4 c d e \fermata
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Pyu -- tit, vē -- ji, na -- lau -- zit, pyu -- tit, vē -- ji, na -- lau -- zi -- ti nu o -- ri -- ņa ū -- zu -- le -- ņu.
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



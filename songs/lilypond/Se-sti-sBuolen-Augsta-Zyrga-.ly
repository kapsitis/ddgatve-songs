\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.25
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key bes \major
\time 4/4
f4 f es d8 [es] | f4 f es d8 [es] | f4 f bes a8 [g] |
bes4 a g f | g g bes a8 [g] | bes4 a8 [g] f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Sēs -- tīs, buo -- leņ, aug -- stā zyr -- gā, ap -- juoj so -- vu
tei -- ru -- me -- ņu, ap -- juoj so -- vu tei -- ru -- meņ.
}

voiceB = \relative c' {
\clef "treble"
\key bes \major
\time 4/4
s1 | s1 | f4 f g f8 [es] |
g4 f es d | es es g f8 [es] | g4 f8 [es] f2
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



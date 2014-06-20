\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.36
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
c'4 a8 [g] | f8 f bes c | d4 (e8) d | c4 c8 [d] |
c bes a g | f2 | c'4 a8 [g] | f f bes c | 
d4 (e8) d | c4 c8 [d] | c bes a g | f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- su dī -- nu Ju -- mi dzy -- nu pa le -- lū -- i tei -- ru -- meņ.
Oi -- jā, oi -- jā, oi -- jā, oi -- jā pa le -- lū -- i tei -- ru -- meņ.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



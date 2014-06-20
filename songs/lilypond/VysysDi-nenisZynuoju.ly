\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.131
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4 
a8 bes c8. c16 | c8 bes a8. g16 | a8 bes c8. c16 | c8 bes a8. a16 |
c8 a bes bes | a a a bes | c a bes bes | a a a4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- sys dī -- ne -- nis zy -- nuo -- ju, vy -- sys dī -- ne -- nis zy -- nuo -- ju,
treis dī -- ne -- nu na -- zy -- nuo -- ju, treis dī -- ne -- nu na -- zy -- nuoj.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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



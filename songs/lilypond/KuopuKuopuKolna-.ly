\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.144
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
a8 a a a | f'4 e8 [c] | d c d f | e4 c \break|
f8 e d d | c b a a | c16 [b] c8 d c16 [b] | a2 \break|
f'8 e d c | e d a g | c c d b | a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kuo -- pu, kuo -- pu kol -- nā, po -- šā kol -- na go -- lā:
ra -- dzu so -- vu lei -- ga -- ve -- ņu gau -- ži rau -- do -- jūt,
ra -- dzu so -- vu lei -- ga -- ve -- ņu gau -- ži rau -- do -- jūt.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



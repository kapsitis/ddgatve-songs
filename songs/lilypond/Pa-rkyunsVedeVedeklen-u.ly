\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.19
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
e4 f e d | e8 e e f g f e e | \time 5/4 d2 f4 e f |
\time 4/4 f8 e d d f f e e  | \time 5/4 d2 f4 e d \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pār -- kyuns ve -- de, pār -- kyuns ve -- de ve -- dek -- le -- ņu, ve -- dek -- le -- ņu,
vy -- su me -- žu puš -- ko -- dam -- si, puš -- kuo -- dam -- s'i.
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



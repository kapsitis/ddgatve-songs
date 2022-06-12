\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.68
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 5/4
c8 d e f g4 c a | g8 a g f e4 d c |
\time 3/4 e f8 [e] d d | c [d] e [f] g4 | g8 a g f e4 | d4 c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vī -- na, vī -- na man muo -- seņ, kam jū dū -- ti, kam na -- dūt,
vī -- na, vī -- na man muo -- seņ, kam jū dū -- ti, kam na -- dūt.
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



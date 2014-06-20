\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.139
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
a8 bes c c | d d c bes | a bes c c | d d c a|
bes bes a a | g g a a | bes bes c8. c16 | c8 bes a4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
A -- tīt vī -- na bol -- ta vīš -- ņa, a -- tīt vī -- na bol -- ta vīš -- ņa
par a -- za -- ru lei -- guo -- da -- ma, par a -- za -- ru lei -- guo -- dam.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 g a a | bes bes a g | f g a a | bes bes a f |
g g f f | e e f f | g g a8. a16 | a8 g f4 \bar"|."
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



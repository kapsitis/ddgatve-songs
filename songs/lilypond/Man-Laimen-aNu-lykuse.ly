\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.105
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 5/8
a8 a a [g] a | bes a g4 a8 | bes bes bes [a] bes | c bes a4. |
a8 a a [g] a | bes a g4 a8 | bes bes bes [a] bes | c bes a4. \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Maņ Lai -- me -- ņa nu -- ly -- ku -- se šū -- god ī -- ti tau -- te -- ņuos,
vai, vai, vai, vai, vai, vai, vai, vai, šū -- god ī -- ti tau -- te -- ņuos.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 5/8
f8 f f [e] f | g f e4 f8 | g g g [f] g | a g f4. |
f8 f f [e] f | g f e4 f8 | g g g [f] g | a g f4. \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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



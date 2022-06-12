\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.24
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f4 d' | c4. a8 | bes4 c8 [bes] | a4 f |
\repeat volta 2 { bes8 bes bes bes | a a a a | g g a g | f f f4 \bar"|." }
}

lyricA = \lyricmode {
\set stanza = "1. "
Ga -- neņš be -- ju, go -- nūs guo -- ju,
ga -- neņš be -- ju, go -- nūs guo -- ju, go -- na drē -- bes mu -- gu -- rā.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f4 bes | a4. f8 | g4 a8 [g] | f4 f |
\repeat volta 2 { g8 g g g | f f f f | g g a g | f f f4 \bar"|." }
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



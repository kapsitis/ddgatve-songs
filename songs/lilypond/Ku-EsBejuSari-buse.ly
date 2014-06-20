\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.109
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {bes8 a g f | g4 bes | a g8 [a]}
g8 g g g | g4 a8 [g] | f4 e8 [f] | g g g g | g4 a8 [g] | f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kū es be -- ju sa -- rī -- bu -- se so -- vai eis -- tai mā -- me -- ņa -- i,
so -- vai eis -- tai mā -- me -- ņai.
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



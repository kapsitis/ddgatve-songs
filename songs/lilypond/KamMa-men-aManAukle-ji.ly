\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.123
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4
c8 c a'4 a | a8 a g4. e8 | c c a'4 a | a8 a g4. e8 |
\repeat volta 2 {g g a4 d,8 [e] | f d c2}
}

lyricA = \lyricmode {
\set stanza = "1. "
Kam, mā -- me -- ņa, man auk -- lē -- ji, kam, mā -- me -- ņa, man auk -- lē -- ji,
kam tik dai -- ļu au -- dzy -- nuoj.
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



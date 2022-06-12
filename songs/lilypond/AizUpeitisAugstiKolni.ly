\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.75
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
g'8 g g16 [a] g8 | f f16 [g] a [g] f8 | g g g16 [a] g8 | f e f16 [e] f8 |
g g g16 [a] g8 | f f16 [g] a [g] f8 | g g g16 [a] g8 | f e f4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Aiz u -- pei -- tis aug -- sti kol -- ni, tī sor -- ko -- nys ū -- gys au -- ga,
aiz u -- pei -- tis aug -- sti kol -- ni, tī sor -- ko -- nys ū -- gys aug.
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



\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.76
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
g'4 g a g | f f a8 [g] f4 | g g a g | f f a8 [g] f4 |
g2 c4 bes | a2 (bes4) a | g2 c4 bes | a1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pa -- teik ma -- ni tys kaļ -- neņš i, kur sor -- ko -- nas ū -- gas au -- ga,
oi, rei -- tā ag -- ri sau -- lei -- te lāc.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\time 4/4
s1 | s1 | s1 | s1|
g'2 a4 g | f2 (g4) f | g2 a4 g | f1
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



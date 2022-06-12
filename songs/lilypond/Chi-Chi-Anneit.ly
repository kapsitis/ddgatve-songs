\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.95
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 3/4
\phrasingSlurDashed
\repeat volta 2 {g4 g \(a\) | g e2 | f8 [e] d4 d | f e2 \break }
\repeat volta 2 {d4 d d | e e e | f8 [e] d4 d}
\alternative {
{f4 e2}
{d4 c2 \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Čī, čī, _ An -- neit, tuo tev i va -- jag,
kam ve -- di Pī -- te -- ri zam loz -- du kryu -- ma. kryu -- ma.
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



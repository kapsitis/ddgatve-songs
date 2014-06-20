\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.65
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
a'8 a a a | bes a g a | bes bes bes bes | c bes a4 |
a8 a a4 | bes8 a g4 | bes8 bes bes bes | c bes a4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Aiz ku ru -- zes šū -- vo -- so -- ri tik sor -- ko -- nys na -- zī -- dēj?
Na zī -- dēj, na -- zī -- dēj, tik sor -- ko -- nys na -- zī -- dēj.
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



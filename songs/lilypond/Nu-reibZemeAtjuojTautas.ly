\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.73
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
a'8 a d c | \time 3/4 a bes c [bes] a4 | \time 2/4 c8 c d d | \time 3/4 a bes c [bes] a4 |
a a a8 g | \time 2/4 f e d d | \time 3/4 a'4 a a8 g | \time 2/4 f e d4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Nū -- reib ze -- me, at -- juoj tau -- tas, nū -- reib ze -- me, at -- juoj tau -- tas,
es gu -- lē -- ju dī -- nas vy -- du, es gu -- lē -- ju dī -- nas vyd'!
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



\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.72
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/4
g'8 a b4 b | \time 4/4 a b g2 | \time 3/4 g8 b d4 d | \time 4/4 c d b2 |
\time 3/4 g8 g e'4 e | \time 4/4 g e d2 | \time 3/4 d4 d c8 b | \time 4/4 c4 d b2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Sē -- ju le -- lu rū -- žu duorz' sev kur dai -- ļi puš -- kuo -- tīs.
Sē -- ju le -- lu rū -- žu duorz' sev kur dai -- ļi puš -- kuo -- tīs.
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



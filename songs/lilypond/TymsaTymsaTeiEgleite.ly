\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.66
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
b'8 b c b | a a a b | c c c c | b b b4 |
b8 b c b | a a a b | c c c c | b b b4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tym -- sa, tym -- sa tei eg -- lei -- te, kur sau -- lei -- te nak -- ti guļ,
nak -- ti gu -- ļi, nak -- ti gu -- ļi, kur sau -- lei -- te nak -- ti guļ.
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



\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.132
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key e \major
\time 3/8
\phrasingSlurDashed
\repeat volta 2 {b8 b b | cis b \(b\) | a a \(a\) | b16 [a] gis4}
\repeat volta 2 {a8 a \(a\) | gis gis \(gis\) | fis \(fis\) a | a gis4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Stuo -- dē -- ju ī -- ve -- ņu pļa -- ve -- nis mo -- lā.
Iz -- au -- ga uo -- be -- le pū - ra vy -- dā.
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



\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Šūpuļdziesmas
% Ai, nama māmiņa, tav' jaukumiņu; ai, nama māmiņa, tav' jaukumiņu.
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 3/8
a8 c d |
\phrasingSlurDashed
c8\( b\) a |
f'8 e d16[f ] |
e8 a,4 |
d8 f e |
\phrasingSlurDashed
d8\( a\) c |
d8 c b |
a8 a4 |
\bar"|."
}




lyricA = \lyricmode {
Ai, na -- ma mā -- mi -- ņa, tav' jau -- ku -- mi -- ņu; ai, na -- ma mā -- mi -- ņa, tav' jau -- ku -- mi -- ņu.
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



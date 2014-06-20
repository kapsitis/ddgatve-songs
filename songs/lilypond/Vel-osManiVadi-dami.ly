\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, bēres
% Veļos mani vadīdami, nejūdziet baltus zirgus
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
f8 f f f |
\phrasingSlurDashed
e8 d d\( d\) |
f8 f f4 |
\phrasingSlurDashed
e8 d d\( d\) |
d8 c c c |
\phrasingSlurDashed
d8 c d\( d\) |
d8 c c c |
d8 c d4 |
\bar"|."
}




lyricA = \lyricmode {
Ve -- ļos ma -- ni va -- dī -- da -- mi, ne -- jū -- dziet bal -- tus zir -- gus;
ve -- ļos ma -- ni va -- dī -- da -- mi, ne -- jū -- dzie -- ti bal -- tus zirg's.
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



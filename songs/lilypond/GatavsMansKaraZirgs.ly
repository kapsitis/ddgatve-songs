\version "2.13.16"
%\header {
%    title = "Gatavs mans kara zirgs"
%}
%#(set-global-staff-size 18)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 8/2
c,4^"Piebalgas balss" e g e d8[ e] f4 e8[ d] c4 c e g e d8[ e] f4 e2 |
a4 g8.[ f16] e4 c g' g a8[ g] f4 e c d8[ e] f4 e d c2
\bar "|."
} 

lyricA = \lyricmode {
Ga -- tavs ma -- nis ka -- ra zir -- gis, 
Es ga -- ta -- vis ka -- ra -- vīrs.
Ga -- tavs ma -- nis ka -- ra zir -- gis, 
Es ga -- ta -- vis ka -- ra -- vīrs.
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




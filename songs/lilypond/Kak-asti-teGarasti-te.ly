\version "2.13.16"
%\header {
%    title = "Kaķastīte, garastīte"
%}
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
e'8 e d d | c8 c g c | b8 b a b | c8 c c4 |
}
\repeat volta 2 {
e,8 g g8. g16 | a8 a a4 | b8 b a8. b16 | c8 c c4 
}
} 

lyricA = \lyricmode {
Kaķ -- as -- tī -- te, gar -- as -- tī -- te, vieg -- li vil -- ka dzir -- na -- viņs. 
Velc ka -- ķī -- te pa -- cie -- šāk, tev as -- tī -- te pa -- ga -- rāk. 
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



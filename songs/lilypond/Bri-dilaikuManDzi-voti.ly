\version "2.13.16"
%\header {
%    title = "Brīdi, laiku man dzīvoti",AA lapas, bēres
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
\key a \minor
\time 2/4
c8 c c g |
\time 3/4
c8 d e4. c8 |
\time 2/4
e8 e f e |
\time 3/4
d8 c16[ b] a4. b8 |
\time 2/4
c8 c e e |
\time 3/4
d8 c16[ b] a2 |
\bar "|."
} 

lyricA = \lyricmode {
Brī -- di, lai -- ku man dzī -- vo -- ti, ne -- dzī -- vo -- ti Sau -- les mū -- žu,
ne -- dzī -- vo -- ti Sau -- les mūž':
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



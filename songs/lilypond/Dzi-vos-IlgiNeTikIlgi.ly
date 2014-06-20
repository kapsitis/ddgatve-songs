\version "2.13.16"
%\header {
%    title = "Dzīvoš' ilgi, ne tik ilgi"
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
\key g \major
\time 2/4
\repeat volta 2 {
g'8 fis16[ e] d8. d16 |
e8 e g g |
g8 b, d( e16) d |
d8 c b4 |
}
} 

lyricA = \lyricmode {
Dzī -- voš' il -- gi, ne tik il -- gi, Sau -- les mū -- žu ne -- dzī -- voš'
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



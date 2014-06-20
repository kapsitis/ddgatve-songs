\version "2.13.16"
%\header {
%    title = "Dzeru, dzeru olu"
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
c8 d e f | g4 c\fermata | a8 a c a | g2
\repeat volta 2 {
f8 f a a | e8 e g4 | d8 f e d | c4 c
}
} 



lyricA = \lyricmode {
Dze -- ru, dze -- ru o -- lu, Dzar -- dams dū -- mo -- ju,
Kur es ī -- šu šū -- vo -- kor, Kur gu -- lieš’ par nak -- ti.
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



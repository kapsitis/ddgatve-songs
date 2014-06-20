\version "2.13.16"
%\header {
%    title = "Aijā, žūžū"
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
c8 d e f | g8 e c e |
g4 a | g8( e) c4 |
g'8 g f d | e8 e c d |
e4( d) | c2 
\bar "|."
} 

lyricA = \lyricmode {
Ai -- jā, žū -- žū, lā -- ča bēr -- ni,
ai -- jā žū -- žū,
pe -- kai -- nā -- mi kā -- ji -- ņā -- mi,
žū -- žū.
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



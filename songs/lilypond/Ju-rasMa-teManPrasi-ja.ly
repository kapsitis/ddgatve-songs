\version "2.13.16"
%\header {
%    title = "Jūras māte man prasīja",AA lapas
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
\key d \minor
\time 4/4
d4 f8[ e] d4 d |
c4 e d a |
d4 f8[ e] d4 d |
c4 e d2 |
\time 6/4
e8[ f] g4 a2 a |
f4 e d1 |
\bar "|."
} 

lyricA = \lyricmode {
Jū -- ras mā -- te man pra -- sī -- ja, ko dar' mū -- su zvej -- nie -- ciņ',
ko dar' mū -- su zvej -- nie -- ciņ'.
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



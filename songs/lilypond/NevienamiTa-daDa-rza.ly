\version "2.13.16"
%\header {
%    title = "Nevienami tāda dārza",A.Ābeles melodija, Jāņi
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
\time 5/8
s2 s8 |
s2 s8 |
s2 s8 |
s2 s8 |
\repeat volta 2 {
e8 e d g4 |
e8 d c16[ bes] a4 |
d8 e d f4 |
e8 d c16[ d] e8[ a,] |
}
} 

voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 5/8
a8[ d] g16[ f] a4 |
a,8[ e'] g16[ f] a4 |
a,8[ d] g16[ f] a4 |
a,8[ e'] g16[ f] a4 |
\repeat volta 2 {
a8[ d] g16[ f] a4 |
a,8[ e'] g16[ f] a4 |
a,8[ d] g16[ f] a4 |
a,8[ e'] g16[ f] a4 |
}
}


lyricA = \lyricmode {
Ne -- vie -- na -- mi tā -- da dār -- za, kā tam mū -- su Jā -- nī -- ša -- mi.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
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



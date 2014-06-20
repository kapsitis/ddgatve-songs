\version "2.13.16"
%\header {
%    title = "Ozolam ir bieza miza",AA lapas, Jāņi
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
\key d \major
\time 2/4
e8 e e cis |
d8 cis cis cis |
d4 e |
fis4 fis |
fis8 e d fis |
e8 d cis cis |
d8[ cis] b4 |
e4 e |
fis8 e d fis |
e8 d cis cis |
d8[ cis] b4 |
} 

lyricA = \lyricmode {
O -- zo -- lam ir bie -- za mi -- za, lī -- go, lī -- go, trim kār -- tā -- mi zel -- ta jos -- ta, lī -- go, lī -- go,
trim kār -- tā -- mi zel -- ta jos -- ta, lī -- go!
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



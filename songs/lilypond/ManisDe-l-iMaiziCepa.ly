\version "2.13.16"
%\header {
%    title = "Manis dēļi maizi cepa",AA lapas, bēres
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
\time 4/4
a4 d c8[ b] a4 |
\time 5/4
d4 c8[ d] e2 a,4 |
\time 4/4
f'4 e d c8[ b] |
a4 g a2 |
\time 6/4
a2 a' g4 a |
f4 e8[ d] e2 a, |
\time 4/4
f'4 e d c8[ b] |
a4 g a2 |
\bar "|."
} 

lyricA = \lyricmode {
Ma -- nis dē -- ļi mai -- zi ce -- pa, brū -- vē sal -- du a -- lu -- tiņ',
vi -- si ē -- da, vi -- si dzē -- ra, ma -- ni ve -- da smil -- tā -- jā.
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



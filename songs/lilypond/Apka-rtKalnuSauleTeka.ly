\version "2.13.16"
%\header {
%    title = "Apkārt kalnu saule teka",AA lapas, Saule, Dieviņš, laima
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
\time 4/4
c4 c8[ d] e4 e |
e8[ f] e[ d] c4 c |
g'4 g g8[ f] e4 |
d8[ e] f4 e2 |
g4 g a8[ g] f4 |
g8[ f] d4 e2 |
\bar "|."
} 

lyricA = \lyricmode {
Ap -- kārt kal -- nu sau -- le te -- ka, ga -- ra ce -- ļa gri -- bē -- dam',
ga -- ra ce -- ļa gri -- bē -- dam'.
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



\version "2.13.16"
%\header {
%    title = "Lija lietus saulītei",AA lapas, Jāņi
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
b8 d d d |
d8 cis b b |
d4 b |
cis8[ d] e4 |
\phrasingSlurDashed
e8 e e\( e\) |
e8 d cis cis |
d4 b |
\time 3/4 
cis4 b2 |
\bar "|."
} 

lyricA = \lyricmode {
Li -- ja lie -- tus sau -- lī -- tē -- i, lī -- go, lī -- go,
ru -- nāj' ļau -- dis vē -- ji -- ņā -- i, lī -- go, lī -- go
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



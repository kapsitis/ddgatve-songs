\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Rāmi, rāmi Jānīts brauca",AA lapas,Laivas melodija, Jāņi
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
c8 c c d |
e8 d c d |
e4 g |
e4 f |
f8 f f f |
g8 e d c |
\time 4/4
e4 d2.
\bar "|." 
}

lyricA = \lyricmode {
Rā -- mi, rā -- mi Jā -- nīts brau -- ca, lī -- go, lī -- go, no kal -- ni -- ņa le -- ji -- ņā -- i, lī -- go.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



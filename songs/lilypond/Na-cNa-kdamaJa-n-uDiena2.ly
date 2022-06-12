\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nāc nākdama Jāņu diena, visi ļaudis tevi gaida",AA lapas,, Jāņi
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
g'8 e d e |
g8 e d e |
g4 fis\fermata |
d4 g\fermata |
e8 d c d |
e8 d c d |
e4 c\fermata |
\bar "|."
} 


lyricA = \lyricmode {
Nāc nāk -- da -- ma, Jā -- ņu die -- na, lī -- go, lī -- go, vi -- si ļau -- dis te -- vi gai -- da, lī -- go!  

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



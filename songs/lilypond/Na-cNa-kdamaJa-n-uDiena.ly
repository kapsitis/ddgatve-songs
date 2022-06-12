\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nāc nākdama Jāņu diena",AA lapas,Laivas melodija, Jāņi
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
\key b \minor
\repeat volta 2 {
\time 3/4
b8 b fis'4 fis |
e8 fis e4 e |
\time 4/4
d8[ e d a] b2 |
\time 3/4 
b8 b fis'4 fis |
e8 fis e4 e |
\time 4/4
d8[ e d a] b2 |
} 
}

lyricA = \lyricmode {
Nāc nāk -- da -- ma, Jā -- ņu die -- na, lī -- go, daudz uz te -- vi gai -- dī -- tā -- ju, lī -- go!  
Nāc nāk -- da -- ma, Jā -- ņu die -- na, lī -- go, daudz uz te -- vi gai -- dī -- tā -- ju, lī -- go! 
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



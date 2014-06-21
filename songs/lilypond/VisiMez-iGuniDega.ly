\version "2.13.16"
% \header {
% title = "Visi meži guni dega"
% }
% FkLaiva; AALapas
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
\key f \major
\slurDashed
\repeat volta 2 {
\time 3/4
f8 e f e d c | 
\time 2/4
a4 a |
\time 3/4
a8 c c a a c | 
\time 2/4
d4( d4) |
}
\time 3/4
d8 f f4 d8[ f] | 
g8 c, g'2 |
a,8 g' f e f e | 
\time 2/4
d4( d) |
\time 3/4
d8 f f4 d8[ f] |
g8 c, g'2 |
\time 3/4
a,8 g' f e f e | 
\time 5/8
d4.~ d4
\bar "|."
} 

lyricA = \lyricmode {
Vi -- si me -- ži gu -- ni de -- ga, 
Vi -- si  ce -- ļi at -- slē -- gām. 
Ar Die -- vi -- ņa pa -- lī -- dziņ' 
Es vi -- sa -- mi cau -- ri tikš',
Ar Die -- vi -- ņa pa -- lī -- dziņ' 
Es vi -- sa -- mi cau -- ri tikš'.
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




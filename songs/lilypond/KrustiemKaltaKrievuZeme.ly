\version "2.13.16"
%\header {
%    title = "Krustiem kalta krievu zeme"
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
e4 g f e | d4 e c c | e4 g f e | d4 e c c \time 2/4 
\repeat volta 2 {
e8 e f d | e8 e e c | d8 d e d | c8 c c4
}    
} 



lyricA = \lyricmode {
Krus -- tiem kal -- ta krie -- vu ze -- me,
krus -- tiem kal -- ta krie -- vu ze -- me, 
Krus -- tiem kal -- ta krie -- vu ze -- me, 
mar -- giem Rī -- ga iz -- mar -- got'.
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



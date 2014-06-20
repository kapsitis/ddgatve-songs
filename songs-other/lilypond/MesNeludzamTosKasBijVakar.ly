\version "2.13.16"
%\header {
%    title = "Mēs nelūdzam tos, kas bij vakar"
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
\key d \minor
\time 6/8
\partial 8*1
a'8 | f8. d16 f8 a g f | f8 e4~ e8 r a | f8. d16 f8 a g e | d4.~ d8 r  
\repeat volta 2 {
d | bes'8 bes bes d c bes | bes8 a4~ a8 r a | d8 a f g f e | d4.~ d8 r  
}
} 




lyricA = \lyricmode {
Mēs ne -- lū -- dzam tos, kas bij va -- kar, 
Mēs ne -- zi -- nām tos, kas būs rīt:
Lai Sta -- ļins vai Čēr -- čils mūs pa -- kar!
Vien -- al -- ga, kā kau -- li -- ņi krīt!
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


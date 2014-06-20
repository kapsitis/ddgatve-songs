\version "2.13.16"
%\header {
%    title = "Kab, muomeņa, tu audzēji"
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
\time 6/8
\partial 4
\repeat volta 2 {
c8 d | e4 e f8 e | d4 d d8 e | f4 e f8 e | g8[ f] e4 
}
} 

lyricA = \lyricmode {
Kab muo -- me -- ņa tu au -- dzē -- ji za -- ļu bier -- zi po -- gol -- mā -- i? 
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











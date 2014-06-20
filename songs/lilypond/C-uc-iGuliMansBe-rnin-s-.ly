\version "2.13.16"
%\header {
%    title = "Čuči, guli, mans bērniņš"
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
g'8 e g r g e g r 
\repeat volta 2 {
g8 g e e g g e r | 
g8 e g r g g e r |
g8 e g e g g e r
}
\repeat volta 2 {
e8 e c c e e c r | 
e8 e f e e d c r |
e8 c e r e c f r | 
e8 e f e e d c r |
}
} 

lyricA = \lyricmode {
M -- m -- m, m -- m -- m,
Ai -- ju, ai -- ju, ai -- jai -- jā. 
Ā -- ā -- ā, ā -- ā -- ā, 
Ai -- ju, ai -- ju, ai -- jai -- jā.
Ču -- či, gu -- li, mans bēr -- niņš. 
Ta -- vi dar -- bi pa -- da -- rīt', 
Ā -- ā -- ā, ā -- ā -- ā,
Ai -- ju, ai -- ju, ai -- jai -- jā.
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



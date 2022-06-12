\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Velc, pelīte, saldu mieg'"
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
\repeat volta 2 {
c8 e e e d c c4 |
c8 e e e d c c4 |
d8 g g g g fis e r |
c8 e e e d c c r |
}
} 

lyricA = \lyricmode {
Velc, pe -- lī -- te, sal -- du mieg', 
Ai -- jā, ai -- jā, ai -- jai -- ja, 
Ai -- jā, ai -- jā, ai -- jai -- ja. 
Ma -- za -- ja -- mi bēr -- ni -- ņam. 
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



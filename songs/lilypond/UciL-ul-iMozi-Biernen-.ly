\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Uci, ļuļi, mozī bierneņ'"
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
\key a \minor
\time 6/8
c'4 c8 b4 c8 | a4 a8 c8( b) a | b4 b8 c4 b8 | 
\slurDashed
a4 a8 a4( a8)
\bar "|." 
} 

lyricA = \lyricmode {
U -- ci, ļu -- ļi, mo -- zī bier -- neņ'
Kas jyus vy -- sus iz -- lei -- guos? 
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



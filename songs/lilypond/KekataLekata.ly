\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ķekatā, ļekatā"
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

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4
a8 a b4 | a8 g8 fis4 | a8 a g fis | b8 a fis4 |
a8 a b b | a8 g8 fis fis | a8 a fis fis | b8 a fis4 
\bar "|."
} 

lyricA = \lyricmode {
Ķe -- ka -- tā, ļe -- ka -- tā, lek -- sim kā -- ļu dār -- zi -- ņā:
Lai aug kā -- ļi, kā -- pos -- ti -- ņi a -- pa -- ļā -- mi gal -- vi -- ņām!
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



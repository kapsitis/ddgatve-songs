\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ļipa kust"
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
\key a \major
\time 2/4
e'8 cis cis4 | e8 cis cis4 |
e8 e fis8. e16 | e8 b b b |
d8 b b4 | d8 b b4 |
e8 e gis8. fis16 | fis8 e e4
\repeat volta 2 {
cis8 cis b a | a gis gis8. gis16 |
d'8 d cis8. b16 | b8 a a4
}
}


lyricA = \lyricmode {
Ļi -- pa kust, ļi -- pa kust, 
kas to ļi -- pu kus -- ti -- nā -- ja.
Ļi -- pa kust, ļi -- pa kust, 
kas to ļi -- pu kus -- ti -- nāj.
Ru -- dzu mai -- ze, kvie -- šu- mai -- ze, 
tā to ļi -- pu kus -- ti -- nāj.
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



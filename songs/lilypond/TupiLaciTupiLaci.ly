\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tupi lāci, tupi lāci"
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
\key g \major
\time 2/4
\repeat volta 2 {
g'8 g b b | g8 g b b |
g8 d' c a | g8 e d4 
}
\repeat volta 2 {
d'8 c b a | g8 fis e d |
c'8 b a g | fis8 e d4  |     
}
} 

lyricA = \lyricmode {
Tu -- pi lā -- ci, tu -- pi lā -- ci, 
sai -- mi -- nie -- ce aiz -- mak -- sās. 
Pie -- ci šķiņ -- ķi ka -- ķa ga -- ļas, 
trīs ku -- ku -- ļi grūs -- tas maiz's.
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



\version "2.13.16"
%\header {
%    title = "Triceja, skaneja"
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
\key f \major
\time 2/4
\repeat volta 2 {
c'4 c16[ bes] a8 | c4 c16[ bes] a8 | g8 g16[ a] bes8 c | a4 r4
}
\time 3/8
\repeat volta 2 {
g8 g f | a8 a c | bes16[ a] g8 bes | bes8 a4
}
} 

lyricA = \lyricmode {
Tri -- cē -- ja, ska -- nē -- ja Bet -- le -- ju mo -- lā, 
na -- be -- ja, na -- be -- ja Je -- zu -- pa muo -- juos. 
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




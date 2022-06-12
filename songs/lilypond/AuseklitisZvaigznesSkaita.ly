\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Auseklītis zvaigznes skaita"
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
\time 2/4
\repeat volta 2 {
a'8 a a a \time 4/2
bes2 a g d\fermata \time 2/4
g8 g g d \time 3/2 
f2 e d\fermata
}
} 



lyricA = \lyricmode {
Au -- sek -- lī -- tis zvaig -- znes skai -- ta, 
Vai ir vi -- sas va -- ka -- rā? 
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



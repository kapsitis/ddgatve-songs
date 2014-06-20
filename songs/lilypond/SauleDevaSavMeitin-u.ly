\version "2.13.16"
%\header {
%    title = "Saule deva sav' meitiņu"
%}
% F/g "Laiva", rokraksts (Perkons.pdf)
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
\time 2/4
\clef "treble"
\key c \major
\repeat volta 2 {
c8 c c e 
\time 3/4
f8 e d4. e8 
\time 2/4
d8 d d d
\time 3/4
d8 c e2 
}
} 


lyricA = \lyricmode {
Sau -- le de -- va sav' mei -- ti -- ņu pār de -- vi -- ņi e -- ze -- riņ'.    
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



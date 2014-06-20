\version "2.13.16"
%\header {
%    title = "Divas dienas mūžiņā"
%}
% F/g "Laiva", rokraksts - laivas_pasakums.pdf, p.3
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
\time 2/4
e8 d c c | a'8 a g8. f16 | e8 e16[ d] c8 e | d8 c d4 | 
e8 d c c | a'8 a g8. f16 | e8 c c16[ d] e8 | d8 d c4
\bar "|."
} 


lyricA = \lyricmode {
Di -- vas die -- nas mū -- ži -- ņā -- i, 
vie -- na la -- ba, ot -- ra ļaun'. 
Di -- vas die -- nas mū -- ži -- ņā -- i, 
vie -- na la -- ba, ot -- ra ļaun'.  
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



\version "2.13.16"
%\header {
%    title = "Aizgāja strēlnieks pa pasauli tālu"
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
c4 c8 c | c4 d8 e | f4 f8 a | c4 bes8 a | 
g4 c,8 c | c4 d8 e | f4 f8 f | f4. f8 
\repeat volta 2 {
bes4 bes8 c | d4 c8 bes | a4 f8 a | c4 bes8 a | 
g4 c,8 c | c4 d8 e | f4 f8 f  
}
\alternative { { f4. f8  } { f2 } }
} 

lyricA = \lyricmode {
Aiz -- gā -- ja strēl -- nieks pa pa -- sau -- li tā -- lu 
Uz ku -- me -- ļa stal -- ta, ka dim -- dē -- ja vien. 
Uz mū -- žu viņš at -- stā -- ja dzim -- te -- ni, mā -- ju, 
Tam no -- lemts bij sve -- šu -- mā pa -- likt ar -- vien. 
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




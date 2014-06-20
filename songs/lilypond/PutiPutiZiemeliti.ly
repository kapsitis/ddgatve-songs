\version "2.13.16"
%\header {
%    title = "Pūti, pūti, ziemelīti"
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
\key e \minor
\time 2/4
\repeat volta 2 {
e8 fis g g | a8 g fis e | 
g8 fis e4 | g8 fis e4
}
} 

lyricAA = \lyricmode {
Pū -- ti, pū -- ti zie -- me -- lī -- ti, 
ka -- la -- dū, ka -- la -- dū, 
}

lyricAB = \lyricmode {
Zie -- mas -- svēt -- ku va -- ka -- rā -- i, 
ka -- la -- dū, ka -- la -- dū!  
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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




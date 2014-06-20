\version "2.13.16"
%\header {
%    title = "Jūrā gāju naudu sēti"
%}
% Gadskārtu ieražu dziesmas, p.271
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
\time 6/4
e4 g fis2 e4( b) 
\time 4/4
g'4 g g fis 
\time 6/4
e4 g fis2 e 
\time 4/4
g4 g g fis 
\time 6/4
g2 fis e 
} 

lyricA = \lyricmode {
Jū -- rā gā -- ju nau -- du sē -- ti, sau -- jā ne -- su, sau -- jā ne -- su dvē -- se -- līt'.
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




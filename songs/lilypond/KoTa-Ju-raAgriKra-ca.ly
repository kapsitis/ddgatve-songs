\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ko tā jūra agri krāca",Budēlīši, jūra
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
\time 3/4
e8 e a4 a |
g8 a g[ fis] e4 |
\time 2/4 
e8 g e e |
\time 4/4 
a4 g a2 |
\time 2/4 
c8 c b a |
\time 4/4
g8[ a] b4 a2 |
\bar "|."
}

lyricA = \lyricmode {
Ko tā jū -- ra ag -- ri krā -- ca mig -- lai -- nā -- i rī -- ti -- ņā, mig -- lai -- nā -- i rī -- ti -- ņā?
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



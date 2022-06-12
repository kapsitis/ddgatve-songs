\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Gāju jūrā naudu sēti",Budēlīši, jūra
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
\time 3/4
e8 g fis4 e8[ b] |
\time 2/4 
g'8 g g fis |
\time 3/4
e8 g fis4 e |
\time 2/4 
g8 g g fis |
\time 3/4
g4 fis e |
\bar "|."
} 

lyricA = \lyricmode {
Gā -- ju jū -- rā nau -- du sē -- ti, sau -- jā ne -- su, sau -- jā ne -- su, dvē -- se -- līt'.
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



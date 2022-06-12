\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es bij' alus dzērējiņa"
%}
% Budēlīši, p.106
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
\key c \major
\time 4/2 g'8 g e c f f a a g g g f e d e f | 
g4 c,8 c f g a4 g8 g g f e d c4   
\bar "|." 
} 

lyricA = \lyricmode {
Es bij' a -- lus dzē -- rē -- ji -- ņa, to es pa -- ti ne -- lie -- dzo -- si, 
Ak, lil -- la, lil -- la -- la, to es pa -- ti ne -- lie -- dzos. 
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Šķūņa jumtu gan redzēju"
%}
% Budēlīši, p.105
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
\key a \minor
\time 4/4 a'8 c a c b g a e | a8 c a c b g a4 |
a16 b c8 a16 b c d e2 | d8 e16 c b8 g a2   
\bar "|." 
} 

lyricA = \lyricmode {
Šķū -- ņa jum -- tu gan re -- dzē -- ju, pa -- ša šķū -- ņa ne -- re -- dzēj'.
Tra -- di -- rī, tra -- di -- ri -- di -- rā, trā -- ri -- di, ne -- re -- dzēj'. 
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



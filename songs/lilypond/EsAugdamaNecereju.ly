\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es augdama necerēju"
%}
% Budēlīši, p.104
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
\time 4/1 g'4 c g4. c,8 f4 a a a f8[ e] d4 d f a a g4. f8 |
e8 d e4 c2 f8 e f4 d2 a'4 g g4. <<d8 e8>> a4 g g2   
\bar "|." 
} 

lyricA = \lyricmode {
Es aug -- da -- ma ne -- ce -- rē -- ju, kā man ie -- si dzie -- vā -- jo -- ti, 
ri -- ri -- ra -- la, ra -- di -- ra -- la! Kā man ie -- si dzie -- vā -- jot. 
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



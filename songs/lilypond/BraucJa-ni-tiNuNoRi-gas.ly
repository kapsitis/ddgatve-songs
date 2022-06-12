\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Brauc, Jānīti, nu no Rīgas"
%}
% http://youtu.be/dT65c94fFE8
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
\time 2/4
g'8 d' d d | c8 b a g | g8[ b] d4 | c8[ e] d4 | 
b8 d d d | c8 b a g |
\time 4/4
b8[ a] g2.   
\bar ".|"
} 

lyricA = \lyricmode {
Brauc, Jā -- nī -- ti, nu no Rī -- gas, lī -- go, 
lī -- go, nu mēs te -- vi sa -- gai -- dā -- m(i), lī -- go! 
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



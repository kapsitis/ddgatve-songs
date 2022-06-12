\version "2.13.18"
#(ly:set-option 'crop #t)

% \header {
%    title = "Kur tecēsi, tu pelīte"
%title = "Līgo pele"
%composer = "f/k Laiva"
% }
% Katrīnai, #62  
% http://www.dainuskapis.lv/daina/33494-7-Dazadas-budelu-dziesmas
\paper {
#(set-paper-size "a3")
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
\time 2/4
d8 d c c | d d c c | d4 c | d c |
d8 d c c | d d c c | d4 c | d c
\bar "|."
} 


lyricA = \lyricmode {
Kur te -- cē -- si, tu pe -- lī -- te? Lī -- go, lī -- go. 
Te -- ku pir -- ti ku -- ri -- nā -- tu. Lī -- go, lī -- go. 
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



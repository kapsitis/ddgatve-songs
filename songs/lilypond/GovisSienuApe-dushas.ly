\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
%  Liela diena, 
% Govis sienu apēdušas, salmi vieni palikuši
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
c8 d e8. c16 f8 f f f |
g8. f16 e8 d d c c4 |
c8 d e8. c16 f8 f f f |
g8. f16 e8 d d c c4 |
c'8 c g g a8. b16 c8 a |
g8. f16 e8 d d c c4 |
c'8 c g g a8. b16 c8 a |
g8. f16 e8 d d c c4 | 
\bar"|."
}




lyricA = \lyricmode {

Gov -- is sie -- nu a -- pē -- du -- šas,
sal -- mi vie -- ni pa -- li -- kuš';
Gov -- is sie -- nu a -- pē -- du -- šas,
sal -- mi vie -- ni pa -- li -- kuš'!
Ko mēs do -- sim jē -- ri -- ņie -- mi,
ko ma -- zā -- mi te -- lī -- tēm;
Ko mēs do -- sim jē -- ri -- ņie -- mi,
ko ma -- zā -- mi te -- lī -- tēm!
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
>>
}
>>



\score{
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



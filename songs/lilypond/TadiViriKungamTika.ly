\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tādi vīri kungam tika"
%}
% Budēlīši, p.101
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
\key f \major
\time 2/4
c'8. d16 c8. bes16 | a8 c f, a | g8 bes16[ a] g8 e | f8 a16[ bes] c4 |
c8. d16 c8. bes16 | a8 c f, a | g8 bes g e | f8 f f4 
\repeat volta 2 {
g16 g g g g8 g16 g | c8 e16 e e8 e16 e | f16[ d] d8 d b | c8 c c4
}
} 

lyricA = \lyricmode {
Tā -- di  vī -- ri kun -- gam ti -- ka, kas dzer a -- lu bran -- da -- vīn'.
Tā -- di  vī -- ri kun -- gam ti -- ka, kas dzer a -- lu bran -- da -- vīn'.
Nu tik vi -- si dū -- šī -- gi, dū -- šī -- gi, dū -- šī -- gi, lai mūs' pul -- ciņš vai -- ro -- jas.
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



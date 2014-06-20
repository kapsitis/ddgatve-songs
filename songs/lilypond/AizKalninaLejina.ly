\version "2.13.16"
%\header {
%    title = "Aiz kalniņa lejiņā"
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
\key c \major
\time 20/8 g'8 e a4 g8 g e f4 d8 f d g4 f8 f e e4. |
c'8 b d4 c8 b a g4 c8 e,8 e a4 g8 g b, c4.   
\bar "|." 
} 

lyricA = \lyricmode {
Aiz kal -- ni -- ņa le -- ji -- ņā -- i cie -- ma mei -- tas ve -- lē -- jās, 
Aiz kal -- ni -- ņa le -- ji -- ņā -- i cie -- ma mei -- tas ve -- lē -- jās.
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



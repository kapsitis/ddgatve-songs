\version "2.13.16"
%\header {
%    title = "Monsoon Showers"
%} 
% Words and Music: Patterson and Meyerkort
% Monsoon Janmashtami Song Book. Sloka, The Hederabad Waldorf School
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
\time 4/4
b'4 b d b | a4 a4 a2 | b4 b d b | a4 g e2 | 
d4 e g b | a4 a a2 
\bar "|."
} 

lyricA = \lyricmode {
Mon -- soon show -- ers, Mon -- soon rain 
Wash the trees all clean a -- gain. 
Wash the trees all clean a -- gain.
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




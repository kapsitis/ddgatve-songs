\version "2.13.16"
%\header {
%    title = "Monsoon Garden"
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
g'4 g g g | d'2 d | g,4 g g g | d'2 r |
b4 d a g | b d a g | d'4 d b a | g1
\bar "|."
} 

lyricA = \lyricmode {
In the Mon -- soon Gar -- den ro -- sy morn -- ing glow
Rain is fall -- ing call -- ing fall -- ing Seed -- lings wake and grow.
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



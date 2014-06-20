\version "2.13.16"
%\header {
%    title = "Little Grains"
%} 
% Words and Music: Jyotsna
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
g'8 g a4 g8 g a4 | g4 a b2 | g4 a b2 |
b8 a g4 a g | g8 a b4  a b | b8 a g4 a g
\bar "|."
}

lyricA = \lyricmode {
Lit -- tle grains, lit -- tle grains
Beg the clouds: Shed thy rain.
Let my roots go down, let my shoots look up, 
let me grow and bloom.
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




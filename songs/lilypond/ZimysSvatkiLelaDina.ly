\version "2.13.16"
%\header {
%    title = "Zīmys svātki, Lela dīna"
%}
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
d'8 d d d | d8 c b c |
d8 c b4 | c8 c d4 |
d8 d d d | d8 c b c |
d8 c b4 | c8 c d4\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Zī -- mys svāt -- ki, Le -- la dī -- na,
Ka -- la -- dū, ka -- la -- dū!
Tī Dī -- va -- mi duor -- gi lai -- ki,
Ka -- la -- dū, ka -- la -- dū!
}

voiceB = \relative c' {
b'8 b b b | b8 a g a |
b8 a g4 | a8 a g4 |
b8 b b b | b8 a g a |
b8 a g4 | g8 g g4  |
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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




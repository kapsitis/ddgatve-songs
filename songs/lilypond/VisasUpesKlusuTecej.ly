\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Visas upes klusu tecēj'"
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
\key c \major
\time 6/8
g'4 e8 g4 e8 | g4 e8 c4 e8 |
a4\p a8 g4 f8 | e4 e8 e4. |
g4\mf e'8 e4 d8 | d4 c8 b4 a8 |
g4 b8 d4 b8 | c4 c8 c4.
\bar "|."
}

lyricA = \lyricmode {
Vi -- sas u -- pes klu -- su te -- cēj',
Gau -- ja klu -- su ne -- te -- cēj'.
Vi -- sas u -- pes klu -- su te -- cēj',
Gau -- ja klu -- su ne -- te -- cēj'.
}

voiceB = \relative c' {
g'4 e8 g4 e8 | g4 e8 c4 e8 |
f4 d8 g4 b,8 | c4 c8 c4. |
g'4 g8 g4 g8 | g4 g8 g4 g8 |
g4 g8 f4 f8 | e4 e8 e4.
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



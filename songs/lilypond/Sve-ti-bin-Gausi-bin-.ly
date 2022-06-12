\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas,
% Svētībiņ, gausībiņ
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\slurDashed
c8 e e8( e) |
e8 d c8( c) |
c8. e16 e8 c |
e8 e d4 |
d8 g g8( g) |
g8 f e8( e) |
f8. f16 e8 e |
f8 f e4 |
\time 4/4 
f8. f16 e4 d2 |
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s4 d4~ | d2~ | d2~ | d2~ | d2~ | 
\time 4/4
d1 |
\bar "|."
}

lyricA = \lyricmode {
Svē -- tī -- biņ, gau -- sī -- biņ, nāc pa lo -- gu is -- ta -- bē;
Svē -- tī -- biņ, gau -- sī -- biņ, nāc pa lo -- gu is -- ta -- bē, nāc pa lo -- gu.
}

lyricB = \lyricmode {
_ Ē -- ē
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricB
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



\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, āra saucamā
% krūmi, krūmi, mezi, meži
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
\phrasingSlurDashed
\phrasingSlurDown
d8 d fis e |
fis8 e d\( d\) |
d8 d fis e |
fis8 e d4 |
e8 e e fis |
e8 d e4 | 
d8 d fis d |
fis e d4 | 
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
s2 | s2 | s2 | s2 | e2\( | d~\) | d2~ | d2~ | 
\bar "|."
}

lyricA = \lyricmode {
Krū -- mi, krū -- mi, me -- ži, me -- ži, ma -- nu bal -- su at -- do -- diet,
krū -- mi, krū -- mi, me -- ži, mež', ma -- nu bal -- su at -- do -- diet.
}

lyricB = \lyricmode {
Ē -- ē_ __
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricB
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



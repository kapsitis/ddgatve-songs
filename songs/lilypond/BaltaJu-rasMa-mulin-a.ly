\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas,
% Balta jūras māmuliņa, baltus dēlus vizināja
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
f8 e d f e d d e |
e8 e f e e d fis g |
g8 fis fis a g g fis e |
\time 5/4
fis8 g a g fis g fis4 e |
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key g \major
\time 4/4
f8 e d f e d d e | e8 e f e e d d d | d2\(  d2\)~ |
\time 5/4
d2~  d2.~ | 
\bar "|."
}

lyricA = \lyricmode {
Bal -- ta jūr -- as mā -- mu -- li -- ņa, bal -- tus dēl -- us vi -- zi -- nā -- ja,
Bal -- ta jūr -- as mā -- mu -- li -- ņa, bal -- tus dēl -- us vi -- zi -- nā -- ja.
}

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ Ē -- ē
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



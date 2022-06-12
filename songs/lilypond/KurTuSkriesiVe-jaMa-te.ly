\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas,
%Kur tu skriesi, Vēja māte
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
f8 e f e |
e8 d d d |
f8 e f e |
e8 d d c |
e8 e d e |
e8 f e4 |
e8 e f e |
f8 e f d |
\time 4/4 
g8 f e d~ d2 |
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s2 | c2~ |c2~ |c2~ |c2\( |
\time 4/4
 d1\)  |
\bar "|."
}

lyricA = \lyricmode {
Kur tu skrie -- si, Vē -- ja mā -- te, sa -- plī -- su -- šu lin -- dru -- ci -- ņu,
kur tu skrie -- si, Vē -- ja māt, sa -- plī -- su -- šu lin -- dru -- ci -- ņu, sa -- plī -- su -- šu.

}

lyricB = \lyricmode {
Ē -- ō!
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


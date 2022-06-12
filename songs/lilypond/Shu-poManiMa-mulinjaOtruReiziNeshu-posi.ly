\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Šūpuļdziesmas
% Šūpo mani māmuliņa, otru reizi nešūposi
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
\phrasingSlurDown
a8^\markup{\left-column {"runas ātrums" "saucējs"}} d d f |
e8 e e e | 
f8 e d e |
d8 d d\( e\) |
f8^\markup{"locītāji"} e f e |
d8 e e4 |
d8 d d e |
f8 e e4 |
e8 d f e |
d8 d d4 
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s4. d8 | s2 | d2\( | d~\) | d2~ | d2~ | d2~ | d2 |
\bar "|."
}

lyricA = \lyricmode {
Šū -- po ma -- ni mā -- mu -- li -- ņa, ot -- ru rei -- zi ne -- šū -- po -- si;
Šū -- po ma -- ni mā -- mu -- liņ, ot -- ru rei -- zi ne -- šū -- pos',  ot -- ru rei -- zi ne -- šū -- pos'.
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



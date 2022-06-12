\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, 
% Kur, Jumīti, glabājiesi, tādu garu vasariņu
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
d8 d c d |
f8 e d d |
e d e e |
e8 f e f |
g8 f e e |
e8 f e f |
g8 f e4( |
e4) d4( |
d2) |
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 |
e8 d c c |
c8 c d4~ |
d2~ |
d2~ |
d2~ |
d2\( |
d2\) |
\bar "|."
}

lyricA = \lyricmode {
Kur, Ju -- mī -- ti, gla -- bā -- jie -- si, tā -- du ga -- ru va -- sa -- ri -- ņu,
kur, Ju -- mī -- ti, gla -- bā -- jie -- si, gla -- bā -- jie -- si?
}

lyricB = \lyricmode {
_ _ _ _ _ _ Ē -- ē
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



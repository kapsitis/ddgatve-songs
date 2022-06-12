\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Es savai māmiņai"
%}
% Austras dziesmu burtnīca, 14.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 6/8
b'16[ a] g8 g a4 b16[ a] | g8 fis e d4 d8 | d8 g8 g a( \stemUp b) fis | g2. |
b16[ a] g8 g a4 b16[ a] | g8 fis e d4 d8 | d8 g8 g a b fis | g2.
\bar "|."
}


lyricA = \lyricmode {
Gu -- la mei -- tī -- na līdz bro -- kas -- tī -- nu, pui -- sī -- tis ne -- ti -- cēj'.
Ce -- lies, mei -- tī -- na, ma -- na sirs -- nī -- na, vai vēl tu ne -- iz -- gu -- lēj. 
}


chordsA = \chordmode {
\time 4/4
g4.:5 d4.:5 | e4.:m b4.:m | g4.:5 d4.:5 | e4.:m d4.:7 |
g4.:5 d4.:5 | e4.:m b4.:m | g4.:5 d4.:5 | g2.:5
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



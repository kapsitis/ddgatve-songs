\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Zied ieviņa pret ieviņu
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
s2 |
s2 | 
s2 |
g'8 g fis fis |
e8 g g fis |
g8 fis e4 |
a,8 g' g fis |
g8 fis e[ fis] |
d8 fis g fis |
g8 fis e4 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
a8 e' e e |
e8 d e e |
d8 e d d |
e8 d e e |
d8 d e e |
e8 d e4 |
a,8 e' d d |
d8 d e[ fis] |
d8 d d d |
d8 d e4 
\bar "|."
}


lyricA = \lyricmode {
Zied ie -- vi -- ņa pret ie -- vi -- ņu kat -- ra kal -- na ga -- li -- ņā -- i,
zied ie -- vi -- ņa pret ie -- viņ' kat -- ra kal -- na ga -- li -- ņāi, kat -- ra kal -- na ga -- li -- ņā 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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



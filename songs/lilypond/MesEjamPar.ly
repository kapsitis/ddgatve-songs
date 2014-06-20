\version "2.13.16"
%\header {
%    title = "Mēs ejam pār"
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
\key d \major
\time 2/4
\partial 8
a8  |
d8 d a a  | d8 d a a  |
d8 cis d fis | a4. fis8 |
g8 g e e | fis8 fis d d |
e8 e cis a | d4. 
\bar "|."
}

lyricA = \lyricmode {
Mēs e -- jam pār, mēs e -- jam  pār, 
pār ve -- co Rī -- gas tilt'. 
Mēs e -- jam pār, mēs e -- jam pār, 
pār ve -- co Rī -- gas tilt'. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



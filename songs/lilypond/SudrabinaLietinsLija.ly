\version "2.13.16"
%\header {
%    title = "Sudrabiņa lietiņš lija"
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
\key d \minor
\time 2/4
d8 d d d | d'8 d d d |
c8 bes c d | c8 bes a4 |
f8 f f g | a8 a a a  |
g8 f e f | e8 d d4
\bar "|."
} 

lyricA = \lyricmode {
Sud -- ra -- bi -- ņa  lie -- tiņš li -- ja 
Zie -- mas svēt -- ku va -- ka -- rā; 
Sud -- ra -- bi -- ņa  lie -- tiņš li -- ja 
Zie -- mas svēt -- ku va -- ka -- rā.
}


voiceB = \relative c' {
d8 d d d | bes'8 bes bes bes |
a8 g a bes | a8 g f8. e16 |
d8 d d e | f8 f f f |
e8 d c c | c8 d d4 
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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




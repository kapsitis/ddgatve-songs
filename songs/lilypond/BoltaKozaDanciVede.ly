\version "2.13.16"
%\header {
%    title = "Bolta koza daņci vede"
%}
%#(set-global-staff-size 18)
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

chordsA = \chordmode {
\time 2/4
g2:5 | c2:5 | g4:5 d4:5 | g2:5 | 
g2:5 | c2:5 | g4:5 d4:5 | g2:5 | 
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
%MS
d'8 d d d | d8 c b c | d4 c8 d | b2 |
%ME
d8 d d d | d8 c b c | d4 c8 d | b2
\bar "|."
} 

lyricA = \lyricmode {
\set stanza = #"1." Bol -- ta ko -- za daņ -- ci ve -- de, la -- du, la -- du!
Iz pa -- lā -- ka ak -- mis -- te -- ņa, la -- du, la -- du!
}


voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
b'8 b b b | b8 a g a | b4 d,8 d | g2 |
b8 b b b | b8 a g a | b4 d,8 d | g2
} 


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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




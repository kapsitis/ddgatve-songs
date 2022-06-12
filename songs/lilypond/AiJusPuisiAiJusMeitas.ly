\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
%    title = "Ai, jūs, puiši, ai, jūs, meitas"
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
\key c \major
\time 2/4
c8 d e d | c8 a g g | c8[ e] g4\fermata |
a8[ g] g4 | e8 c g' e | f8 e d c | g8[ b] c4 | g'8[ e] f4 |
e8 c g' e | f8 e d c | g8[ b] c4
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | c8[ e] e4\fermata |
f8[ e] e4 | c8 g e' c | d8 c b a | g4 g4 | e'8[ c] d4 |
c8 g e' c | d8 c b a | g4 g4
\bar "|."
} 



lyricA = \lyricmode {
Ai, jūs, pui -- ši, Ai, jūs, mei -- tas, lī -- go, lī -- go!
Jā -- ņu nak -- ti ne -- gu -- ļa -- ti, lī -- go, lī -- go!
Jā -- ņu nak -- ti ne -- gu -- ļa -- ti, lī -- go!
}

chordsA = \chordmode {
\time 2/4
c2:5 | c4:5 g4:5 | c2:5 | f4:5 c4:5 | c2:5 |
f2:5 | g4:5 c4:5 | c4:5 f4:5 | c2:5 | f2:5 | g4:5 c4:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



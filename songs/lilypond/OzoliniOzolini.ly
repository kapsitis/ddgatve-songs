\version "2.13.16"
%\header {
%    title = "Ozoliņi, ozoliņi"
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


voiceA = \transpose d c { \relative c' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
d8 fis fis a | a8 fis e d | d8[ e] fis4 | e4 d 
}
} }

voiceB = \transpose d c { \relative c' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
s2*2 | d8[ e] d4 | a4 d 
}
} }

lyricAA = \lyricmode {
O -- zo -- li -- ņi, o -- zo -- li -- ņi, lī -- go, lī -- go!
}

lyricAB = \lyricmode {
Ta -- vu lie -- lu res -- nu -- mi -- ņu, lī -- go, lī -- go!
}

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | g4:5 c4:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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



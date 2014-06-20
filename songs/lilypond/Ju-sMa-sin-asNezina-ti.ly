\version "2.13.16"
%\header {
%    title = "Jūs, māsiņas, nezināti"
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


voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8 f d f | e8 d c bes | a4 a'4\fermata |
g8[ bes8] a4 
\repeat volta 2 {
g8 f bes a | g f e f | c4 d4\fermata
}
} }

voiceB = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
s2*3 |
e8[ g8] f4 
\repeat volta 2 {
e8 d g f | e d c d | a4 d4\fermata
}
} }

lyricA = \lyricmode {
Jūs, mā -- si -- ņas ne -- zi -- nā -- ti, lī -- go, lī -- go, 
Kur guļ go -- vu Mār -- ša -- vi -- ņa, lī -- go! 
}

chordsA = \chordmode {
\time 2/4
a2:m | a2:m | e2:m | g4:5 a4:m | 
\repeat volta 2 {
g2:5 | a2:m | g4:5 a4:m |
}
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



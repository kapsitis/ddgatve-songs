\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labvakari, Jāņa māte"
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


voiceA = \transpose d c  { \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 fis fis d | fis8 e d d | fis4 d | e4 d |
fis8 a a fis | a8 g fis fis | a4 fis | g4 fis 
\bar "|."
} }


voiceB = \transpose d c  { \relative c' {
\clef "treble"
\key d \major
\time 2/4
s2*4 |
d8 fis fis d | fis8 e d d | fis4 d | e4 d
} }

lyricA = \lyricmode {
Lab -- va -- ka -- ri, Jā -- ņa mā -- te, lī -- go, lī -- go, 
Lab -- va -- ka -- ri, Jā -- ņa tēv -- si, lī -- go, lī -- go.
}


chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | g4:5 c4:5 | 
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



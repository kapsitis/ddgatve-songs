\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Dindaru, dandaru, ozoliņi"
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


voiceA = \transpose e c' { \relative c' {
\clef "treble"
\key e \major
\time 2/4
e8( e) e e | e8( e) e e | e8( e) e8( e) | fis8( fis) b,8( b) |
b8( b) b b | b8( b) b b | b8( b) b8( b) | b8( b) b4 
\bar "|."
} }

lyricA = \lyricmode {
Din -- da -- ru, dan -- da -- ru, o -- zo -- li -- ņi, 
din -- da -- ru, dan -- da -- ru, o -- zo -- li -- ņi.
}


voiceB = \transpose e c' { \relative c' {
\clef "treble"
\key e \major
\time 2/4
s2 | s2 | s2 | s2 |
fis8( gis) fis e | fis8( fis) fis fis | fis8( gis) fis8( e) | gis8( fis) fis4 |
} }

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 | 
g2:5 | g2:5 | g2:5 | g2:5 | 
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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



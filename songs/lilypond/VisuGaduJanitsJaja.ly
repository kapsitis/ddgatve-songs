\version "2.13.16"
%\header {
%    title = "Visu gadu Jānīt's jāja"
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


voiceA = \transpose g c { \relative c'' {
\clef "treble"
\key g \major
\time 2/4
\oneVoice
g8^"ātri" b d d | g,8 b d d | d4 g | fis8[ e] e4 
\voiceOne
\repeat volta 2 {
d8 d e c | b8 b d b | a4 d | d4 g,
}
} }

lyricA = \lyricmode {
Vi -- su ga -- du Jā -- nīts jā -- ja, lī -- go, lī -- go, 
Nu at -- jā -- ja šo -- va -- ka -- ri, lī -- go, lī -- go. 
}

voiceB = \transpose g c { \relative c'' {
\clef "treble"
\key g \major
\time 2/4
s2 | s2 | s2 | s2 |
\repeat volta 2 {
b8 b c a | g8 g b g | fis4 b | a4 g
}
} }

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 
\repeat volta 2 {
g2:5 | c2:5 | g2:5 | c2:5
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



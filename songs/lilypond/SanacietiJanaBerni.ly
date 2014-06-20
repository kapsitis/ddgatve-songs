\version "2.13.16"
%\header {
%    title = "Sanācieti Jāņa bērni"
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
fis8 a a a | a8 g fis g | a4 fis | g4 fis |
fis8 a a b | a8 g fis g | a4 fis | g4 fis |
\bar "|."
} }

lyricA = \lyricmode {
Sa -- nā -- cie -- ti, Jā -- ņa bēr -- ni, lī -- go, lī -- go, 
Sa -- gai -- die -- ti Jā -- ņu die -- nu, lī -- go, lī -- go!
}

voiceB = \transpose d c { \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 fis fis fis | fis8 e d e | fis4 d | e4 d |
d8 fis fis g | fis8 e d e | fis4 d | e4 d |
} }

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



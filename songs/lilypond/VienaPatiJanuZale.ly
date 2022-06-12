\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Viena pati Jāņu zāle"
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
d8 e f f | g8 e d e | f8[ g] a4\fermata | g8[ bes] a4\fermata | 
f8 a a f | a8 f e d | cis8[ e] d4\fermata
\bar "|."
} }

lyricA = \lyricmode {
Vie -- na pa -- ti Jā -- ņu zā -- le, lī -- go, lī -- go, 
de -- vi -- ņā -- mi sta -- ri -- ņā -- mi, lī -- go. 
}

voiceB = \transpose d a  { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8 e f f | g8 e d e | d8[ e] f4 | e8[ g] f4 | 
d8 f f d | f8 d cis bes | a8[ cis] d4
} }

chordsA = \chordmode {
a2:m | a2:m | a4:m e4:m | e2:m |
a2:m | a2:m | a2:m 
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sit, Jānīti, vara bungas"
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
\key f \major
\time 2/4
f8 f f f | g8 g c, c |
f8[ g] a4 | g4 g |
a8 a a a | a a d, e | 
f4 c
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
s2*2 
f4 f4 | e8[ d] c4 |
f8 e d c | d d c c | 
a4 a
\bar "|."
} 

lyricA = \lyricmode {
Sit, Jā -- nī -- ti, va -- ra bun -- gas, 
lī -- go, lī -- go, 
Sa -- kur Jā -- ņa u -- gun -- ti -- ņu,
lī -- go! 
}

chordsA = \chordmode {
\time 2/4
f2:5 | g4:5 c4:5 | f2:5 | c2:5 | a2:m | a2:m | f4:5 c4:5 |
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



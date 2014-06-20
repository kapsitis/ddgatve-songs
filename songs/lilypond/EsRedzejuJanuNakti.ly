\version "2.13.16"
%\header {
%    title = "Es redzēju Jāņu nakti"
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


voiceA = \transpose g c' { \relative c' {
\clef "treble"
\key g \major
\time 2/4
d8 d d d | d c b c \time 3/4 
d4 b2 | c4( e4. d8) | d2.
\time 2/4
d8 d d d | d c b c \time 3/4 
d4 b2 | c4( e4. d8) | d2.
\bar "|."
} }

voiceB = \transpose g c' { \relative c' {
\clef "treble"
\key g \major
\time 2/4
b8 b b b | b a g a \time 3/4 
b4 g2 | a4( c4. b8) | b2.
\time 2/4
b8 b b b | b a g a \time 3/4 
b4 g2 | a4( c4. b8) | b2.
\bar "|."
} }

lyricA = \lyricmode {
Es re -- dzē -- ju Jā -- ņu nak -- ti, lī -- go, lī -- go! 
Trīs sau -- lī -- tes uz -- le -- ca -- mi, lī -- go, lī -- go!
}

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | 
\time 3/4
c2.:5 | g2.:5 | c2.:5 |
\time 2/4
c2:5 | c2:5 | 
\time 3/4
c2.:5 | g2.:5 | c2.:5 |
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



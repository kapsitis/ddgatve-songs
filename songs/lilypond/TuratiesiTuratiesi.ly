\version "2.13.16"
%\header {
%    title = "Turatiesi, turatiesi"
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


voiceA = \transpose g c  { \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 b d d | d8 a c b | g8 b d d  | d8 a c b 
\time 3/4
g4 d'2 | c4 b2 | a4 g2
\bar "|."
} }

lyricA = \lyricmode {
Tu -- ra -- tie -- si, tu -- ra -- tie -- si, 
Vi -- ņas pu -- ses dzie -- dā -- tā -- ji, 
lī -- go, lī -- go, lī -- go!
}

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 | 
\time 3/4
c4:5 g2:5 | g4:5 c2:5 | c2.:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



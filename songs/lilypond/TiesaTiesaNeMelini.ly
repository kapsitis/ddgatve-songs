\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tiesa, tiesa, ne meliņi"
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
\time 4/4
f8 f f f  e8 e d e \time 6/8 
f4 d2 e4 c2 \time 4/4
f8 f f f f8 f e e |
f8[ e] d4 e4 f4 |
f8 f f f f8 f f f \time 6/8 
f8[ e] d2\fermata \time 4/4
f8 f f f  f8 f f f \time 6/8 
f8[ e] d4( e8 d8) 
\bar "|."
} }

lyricA = \lyricmode {
Tie -- sa, tie -- sa, ne me -- li -- ņi lī -- go, lī -- go, 
Ve -- cu ļau -- žu va -- lo -- di -- ņa, lī -- go, lī -- go.
Ve -- cu ļau -- žu va -- lo -- di -- ņa, lī -- go, 
Ve -- cu ļau -- žu va -- lo -- di -- ņa, lī -- go.
}

chordsA = \chordmode {
\time 4/4
a2:m g4:5 a4:m | 
\time 6/8
a2.:m | g2.:5 |
\time 4/4
a1:m | a1:m | a1:m |
\time 6/8
a2.:m |
\time 4/4
a1:m |
\time 6/8
a2.:m
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



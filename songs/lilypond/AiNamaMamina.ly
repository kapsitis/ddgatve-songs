\version "2.13.16"
%\header {
%    title = "Ai, nama māmīna"
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

chordsA = \chordmode {
\time 2/4
\repeat volta 2 {
g2:5 | d2:5 | d2:5 | g2:5 | 
}
\time 3/8
\repeat volta 2 {
g4.:5 | d4.:5 | d4.:5 | g4.:5 
}
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
%MS
g4 b8 a | a4 g8 fis | a8 a g fis | g4 g
%ME
}
\time 3/8
\repeat volta 2 {
g8 b a | a8 g fis | a8 g fis | g8 g4
}
} 

lyricA = \lyricmode {
Ai, na -- ma mā -- mī -- na, da -- ri dur -- ve -- tī -- nas!
Ķe -- ka -- tas at -- brau -- ca a' ve -- zu -- mī -- nu,
} 

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ 
A' mie -- zis, a' ru -- dzis, a' ku -- me -- lī -- nis.
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
\lyricsto "voiceA" \new Lyrics \lyricB
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




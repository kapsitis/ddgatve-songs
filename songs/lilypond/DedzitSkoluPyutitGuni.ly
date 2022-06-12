\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Dedzit skalu, pyutit guni"
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
\time 6/8
g2.:5 |
\time 5/8
d4.:5 g4:5 |
\time 6/8
d2.:7 |
d4.:7 g4:5
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 6/8
%MS
d8 g4 b8 c[ b ] 
\time 5/8
a8 c[ b] a g 
%ME
\time 6/8
c8 b[ a] b c4 |
b8 a4 g4. |
\bar "|."
} 

lyricA = \lyricmode {
De -- dzit sko -- lu, pyu -- tit gu -- ni, 
lai -- dit Dī -- vu us -- to -- bā!
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



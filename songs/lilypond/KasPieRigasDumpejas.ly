\version "2.13.16"
%\header {
%    title = "Kas pie Rīgas dumpējās"
%}
%#(set-global-staff-size 18)
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
c2:5 | c2:5 | c2:5 | c2:5 |
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\oneVoice
g'16 g g g g f e f | g8 f16 e g8 f16 e | g16 g g g g f e f | 
\voiceOne
g8 f16 e f8 e 
\bar "|." 
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s4 d8 c 
} 


lyricA = \lyricmode {
Kas pie Rī -- gas dum -- pē -- jā -- si, kō -- lan -- da, kō -- lan -- da,
A -- pakš le -- dus Dau -- ga -- vā -- i, kō -- lan -- da, ko -- la. 
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




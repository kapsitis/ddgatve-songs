\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nu atbrauca Ziemassvētki",AA lapas
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
c2:5 | f4:5 c4:5 | g4:5 c4:5 | g4:5 c4:5 |   
c2:5 | f4:5 c4:5 | g4:5 c4:5 | g4:5 c4:5 |
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
\phrasingSlurDown
c8 d e e |
f8 f e e |
f8 f e4 |
d8 d c4 |
c8 d e e |
f8 f e\( e\) |
f8 d e4 |
f8 d c4 |
\bar "|."
}

lyricA = \lyricmode {
Nu at -- brau -- ca Zie -- mas -- svēt -- ki, ka -- la -- dū, ka -- la -- dū,
rak -- stī -- tā -- mi ka -- ma -- nā -- mi, ka -- la -- dū, ka -- la -- dū!
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



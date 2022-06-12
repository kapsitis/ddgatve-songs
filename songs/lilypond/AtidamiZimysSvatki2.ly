\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Atīdami Zīmys svātki"
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
g2:5 | c4:5 g4:5 | c4:5 g4:5 | d4:5 g4:5 | 
g2:5 | c4:5 g4:5 | c4:5 g4:5 | d4:5 g4:5 | 
}


voiceA = \relative c' {
\time 2/4
\clef "treble"
\key g \major
%MS
\oneVoice
b'8 g g g | c8 c  b b | c16[ b] a8 g4 | 
%ME
\voiceOne
a8 g16[ a] b4 |
b8 g g g | c8 c  b b | c16[ b] a8 g4 | a8 a g4 
\bar "|."
} 

voiceB = \relative c' {
\time 2/4
\clef "treble"
\key g \major
s2 | s2 | s2 | c8 c <<d4 g>> |
b8 g g g | a8 a  g g | a8 a8 g4 | c,8 c g'4 |
} 



lyricA = \lyricmode {
At -- ī -- da -- mi Zī -- mys svāt -- ki, ka -- la -- dō, ka -- la -- dō!
At -- nas da -- su  le -- lu ku -- li, ka -- la -- dō, ka -- la -- dō!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



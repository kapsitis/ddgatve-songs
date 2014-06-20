\version "2.13.16"
%\header {
%    title = "Zīmas svātki sabraukuši"
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
e2:m | e2:m | e2:m | e2:m | e2:m | 
e2:m | e4:m b4:5 | b4:5 e4:m |  g2:5 | c2:5 | 
c4:5 g4:5 | d4:5 g4:5 | g2:5 | c2:5 | c4:5 g4:5 | d4:5 g4:5 |
}


voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
\oneVoice
e8 fis g g | g8 fis e e | g8 e g4 | e8 fis g4 |
e8 fis g g | g8 fis e e | g8 e d4 | d8 d e4
\bar "|."
g8 g a b | c8 b a g | 
\voiceOne
c8 a g4 | d8 d g4 |		
g8 g a b | c8 b a g | c8 a g4 | d8 d g4		
\bar "|."
} 

lyricA = \lyricmode {
Zī -- mas svāt -- ki sa -- brau -- ku -- ši, ka -- la -- dō, ka -- la -- dō!
Rak -- stei -- to -- mi ko -- mo -- no -- mi, ka -- la -- dō, ka -- la -- dō!
Te -- cit, bār -- ni, sa -- je -- mi -- ti, ka -- la -- dō, ka -- la -- dō!		
Bo -- sa -- juo -- mi, kuo -- je -- ņo -- mi! ka -- la -- dō, ka -- la -- dō!
} 

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
s2 | s2 | s2 | s2 | s2 | 
s2 | s2 | s2 | s2 | s2 | 
a'8 fis g4 | d8 d g4 | g8 g a g | a8 g fis e | a8 fis g4 | d8 d g4 |
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




\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labvakari saimeniece"
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
g2:5 | g2:5 | g2:5 | g2:5 |
g2:5 | g2:5 | g4:5 d4:5 | g2:5 | 
}


voiceA = \relative c' {
\time 2/4
\clef "treble"
\key g \major
b'8^"Paātri, brammanīgi" g g g 
<< { 
d8 d g a | b8 g g g | d8 d g r
} 
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
firstClef = ##f
}
{ \autoBeamOff d8 d g g | g8 d g d | g8 g g r }
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
firstClef = ##f
}
{ \autoBeamOff d8 d g a | b8 a g g | d8 d g r }    
>>
b8 b b b | d8 d d4 | g,8 g g d | g8 g g r
\bar "|."
} 

voiceC = \relative c' {
\time 2/4
\clef "treble"
\key g \major
b'8^"Paātri, brammanīgi" g g g | d8 d g a | b8 g g g | d8 d g r |
b8 b b b | d8 d d4 | g,8 g g d | g8 g g r
\bar "|."
} 



voiceB = \relative c' {
\time 2/4
\clef "treble"
\key g \major
g'8 d d d | b8 b d d | g8 d d d | b8 b d4 |
g8 g g g | b8 b b4 | d,8 d d b | d8 d d r |
} 



lyricA = \lyricmode {
Lab -- va -- ka -- ri, sai -- me -- nie -- ce, vai gai -- dī -- ji bu -- de -- līš'?
Ja gai -- dī -- ji bu -- de -- līš', at -- ver dur -- vis līdz ga -- lam!
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, bagāti ziemassvētki" 
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
c2:5 | c2:5 | d2:m | c2:5 | c2:5 | d2:m | 
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
%MS
\oneVoice
g'8 g g g | g8 f e d | 
\voiceOne
f8[ e] d4 |
%ME 
g8 g g g | g8 f e d | f8[ e] d4  
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
s2 | s2 | c4 d4 |
e8 e d e | e8 d c d | c4 d4  
}
} 

lyricA = \lyricmode {
Ai, ba -- gā -- ti zie -- mas svēt -- ki, kū -- čō,
Le -- ji -- ņā -- i no -- gā -- ju -- ši, kū -- čō. 
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




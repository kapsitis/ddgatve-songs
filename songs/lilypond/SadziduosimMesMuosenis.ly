\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sadzīduosim mes, muosenis"
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

voiceA = \relative c'' {
\clef "treble"
\key e \minor
\repeat volta 2 {
\time 3/4
b4. g8 b b 
\time 2/4
a8 fis a c 
}
b8 a g fis | g8 e e b
\time 3/4
e8 g b4. b8 
\time 4/4
a4 g8 fis e2
\bar "|."
} 

lyricA = \lyricmode {
Sa -- dzī -- duo -- sim mes, muo -- se -- nis,
Ci -- kom vī -- nā vī -- te -- ņā -- (i),
Ci -- kom vī -- nā vī -- te -- ņā.
} 


voiceB = \relative c' {
\clef "treble"
\key e \minor
\repeat volta 2 {
\time 3/4
s2.
\time 2/4
s2
}
s2 | s2 
\time 3/4
e8 g g4. g8 
\time 4/4
fis4 e8 d e2
} 


fullScore = <<
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



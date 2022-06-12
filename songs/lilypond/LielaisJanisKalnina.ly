\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lielais Jānis kalniņā"
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


voiceA = \transpose d g { \relative c'' {
\clef "treble"
\key g \major
\time 4/4
\repeat volta 2 {
a8 a a8. fis16 a8 a a8. fis16 | a8 a g e d d d4 
}
\repeat volta 2 {
d4 g8 g8 b4 b8 b | c4 a8 fis g g g4
}
} }

voiceB = \transpose d g { \relative c' {
\clef "treble"
\key g \major
\time 4/4
\repeat volta 2 {
fis8 fis fis8. d16 fis8 fis fis8. d16 | fis8 fis e cis d d d4 
}
\repeat volta 2 {
d4 g8 g g4 g8 g | a4 fis8 fis g g g4  
}
} }


lyricA = \lyricmode {
Lie -- lais Jā -- nis kal -- ni -- ņā -- i strī -- ķē sa -- vu iz -- kap -- tiņ'. 
Trin, Jā -- nīt, trin, Jā -- nīt trin Jā -- nīt iz -- kap -- tiņ'. 
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



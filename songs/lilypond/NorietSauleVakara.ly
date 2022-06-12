\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Noriet saule vakarā"
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


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8\mf a g d | g a g d \time 3/4
g4 b4.( c8) | b4  a4.( b8) 
\time 2/4
c8 c c a | c b a g \time 3/4
g4 b4.( c8) | b4 a4.( g8) 
\bar "|."
}

lyricA = \lyricmode {
No -- riet sau -- le va -- ka -- rā -- i, ro -- tā, ro -- tā,
Vi -- sus  ko -- kus vel -- tī -- da -- ma, ro -- tā, ro -- tā.
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
s2 | s2 
\time 3/4 
g'4 g2~ | g2.~ 
\time 2/4
g2~ | g2~ 
\time 3/4
g2.~ | g2.
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



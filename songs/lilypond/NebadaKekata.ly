\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nebada ķekata"
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
\key g \major
\time 3/8
d8 a a | d8 a a 
\time 2/4 
d8^\markup {
  \vcenter {
    \column { 2 4 } 
    = 
    \column { 3 8 }
  }
} a d a | d4-> d4->
\time 3/8
g,8 g g | g8 g g 
\time 2/4 
\slurDashed
g8( g) g g | g4-> g->
\bar "|."
} 

lyricA = \lyricmode {
Ne -- ba -- da ķe -- ka -- ta ga -- ļas la -- bad lē -- ce, 
Ne -- ba -- da ķe -- ka -- ta gaļas la -- bad lē -- ce.
}

lyricB = \lyricmode {
Li -- nī -- nu la -- ba -- de, balt' _ a -- ve -- tī -- nu;
Li -- nī -- nu la -- ba -- de, balt' a -- ve -- tī -- nu.
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceA" \lyricB
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



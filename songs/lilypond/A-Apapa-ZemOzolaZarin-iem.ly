\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ā apapā, zem ozola zariņiem"
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
\key c \major
\time 2/4
\repeat volta 2 {
\slurDashed
e8( f f8. e16) | a8 g e8.( e16) | 
\slurSolid
g8 g a g16( f16) | g8 f e4 
}
} 

lyricA = \lyricmode {
Ā a -- pa -- pā, zem o -- zo -- la za -- ri -- ņiem. 
} 

fullScore = <<
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



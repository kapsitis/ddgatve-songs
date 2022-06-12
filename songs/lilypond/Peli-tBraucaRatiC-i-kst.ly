\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pelīt brauca rati čīkst"
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
c8 c d d | e8 d d4 | g8 f e c | e8 d d4\fermata
}
} 

lyricA = \lyricmode {
Pe -- līt' brau -- ca, ra -- ti čīkst pil -- nu mie -- ga ve -- zu -- miņ'. 
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



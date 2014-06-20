\version "2.13.16"
%\header {
%    title = "Pelīt brauca, vāģi čīkst"
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
g'8 e f d | f8 e e4 | e8 d d8. b16 | d8 c c4
\bar "|."
} 

lyricA = \lyricmode {
Pe -- līt brau -- ca, vā -- ģi čīkst 
ar to mie -- ga ve -- zu -- miņ'.  
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



\version "2.13.16"
%\header {
%    title = "Es tev lūdzu, Jāņa tēvs(i)"
%}
% http://youtu.be/D2y6NgJ46FY
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
\time 4/4
g'8 c c d e d c g | 
c4 d e d8 c | 
e8 d e d e d c g | 
c4 d2.
\bar ".|"
} 

lyricA = \lyricmode {
Es tev lū -- dzu, Jā -- ņa tēvs -- (i), lī -- go, Jā -- ni -- ti,
at -- ver sa -- vus va -- ra vār -- tus, lī -- go!
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



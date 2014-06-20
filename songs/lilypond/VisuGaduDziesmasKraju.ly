\version "2.13.16"
%\header {
%    title = "Visu gadu dziesmas krāju"
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
\key bes \major
\time 2/4
bes8 f' f f | f d bes bes 
\time 3/4
bes'4 a2 | g4 f2 
\time 2/4
d8 f f f | f8 d c bes 
\time 3/4
g'4 f2 | ees4 d2 | bes'4 a2 | g4 f2 
\time 2/4
d8 f f f | f8 d c bes 
\time 3/4
g'4 f2 | ees4 d2
\bar "|."
} 

lyricA = \lyricmode {
Vi -- su ga -- du dzies -- mas krā -- ju, 
lī -- go, lī -- go, 
Jā -- ņu die -- nu gai -- dī -- da -- ma, 
lī -- go, lī -- go, lī -- go, lī -- go, 
Jā -- ņu die -- nu gai -- dī -- da -- ma, 
lī -- go, lī -- go!  
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zaļa, zaļa, skaļa, skaļa"
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
\key e \minor
\time 2/4
e8 b' b b | c8 b b a | d,4 a' | b4 c8 b | 
a8 b b b | c8 b b a | e4 a | g8 fis e4
\bar "|."
} 

lyricA = \lyricmode {
Za -- ļa, za -- ļa, ska -- ļa, ska -- ļa, lī -- gū, Jā -- ni -- ti!
Ma -- na bēr -- zu birz -- ta -- li -- ņa, lī -- gū, Jā -- ni -- ti!
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




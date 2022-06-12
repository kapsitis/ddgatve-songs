\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pa gadskārtu Jānīts nāca"
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
g'8 d' d d | c8 b a g 
\repeat volta 2 { 
\time 2/4
g8[ b] d4 | 
c8[ e] d4 | b8 d d d | c8 b a g 
\time 4/4
b8[ a] g2.   
}
}

lyricA = \lyricmode {
Pa gads -- kār -- tu Jā -- nīts nā -- ca, lī -- go, lī -- go, 
Sa -- vus bēr -- nus ap -- rau -- dzī -- ti, lī -- go.
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



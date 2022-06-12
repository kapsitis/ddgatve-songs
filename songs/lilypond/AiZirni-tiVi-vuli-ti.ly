\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, zirnīti, vīvulīti"
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
\repeat volta 2 {
\time 3/4
g'4. e8 f d |
\time 5/4
c8 c a'2 f |
\time 3/4
g4. a8 g f |
e8 d c2 |
}
\repeat volta 2 {
\time 2/4 
g'8 e f d |
c8 c a' a |
g8 e f d |
c8 c c4 |
}
} 

lyricA = \lyricmode {
Ai, zir -- nī -- ti, vī -- vu -- lī -- ti, dod zie -- di -- ņu lai -- vi -- ņai,
Lai va -- rē -- ju pār -- lī -- go -- ti pār Lu -- bā -- na e -- ze -- riņ.
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



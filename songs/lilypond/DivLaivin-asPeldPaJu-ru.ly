\version "2.13.16"
%\header {
%    title = "Div' laiviņas peld pa jūru",AA lapas
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
\time 4/4 
g'4 g8[ f] e8[ d] c4 |
e4( g8) e8 d4 a' |
g4 g8[ f] e8[ d] c4 |
e4( g8) e8 d4. c8 |
\repeat volta 2 {
\time 4/4
b8 d d d b d d d |
c4( b8) a g2 |
}
} 

lyricA = \lyricmode {
Div' lai -- vi -- ņas peld pa jū -- ru, div' lai -- vi -- ņas peld pa jū -- ru,
nied -- res vie -- ni, nied -- res vie -- ni lī -- go -- jās.
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



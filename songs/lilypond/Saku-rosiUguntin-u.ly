\version "2.13.16"
%\header {
%    title = "Es sakūru uguntiņu"
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


voiceA = \transpose d e { \relative c' {
\clef "treble"
\key d \minor
\time 4/4
\repeat volta 2 {
f8 f e d e d d4 | f8 f e d e d d4 |
c8 c c c c d d4 | c8 c c c c d d4 
}
\alternative {
{f8 f e d e d d4\fermata } 
{f8 f e d e d d4\fermata }
}
} }

voiceB = \transpose d e { \relative c' {
\clef "treble"
\key d \minor
\time 4/4
\repeat volta 2 {
a'8 a g f g f f4 | a8 a g f g f f4 |
e8 e e e e f f4 | e8 e e e e f f4
}
\alternative {
{a8 a g f g a f4\fermata } 
{c'8 c b a b c a4\fermata }
}
} }


lyricA = \lyricmode {
Sa -- kū -- ro -- si u -- gun -- tiņ' no de -- vi -- ņi ža -- ga -- riņ',
Sa -- kū -- ro -- si u -- gun -- tiņ' no de -- vi -- ņi ža -- ga -- riņ,
no de -- vi -- ņi ža -- ga -- riņ'.
no de -- vi -- ņi ža -- ga -- riņ'.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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




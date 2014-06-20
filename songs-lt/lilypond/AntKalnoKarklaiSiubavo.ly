\version "2.13.16"
%\header {
%    title = "Ant kalno karklai siūbavo"
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
c4 c8 d e4 f | e4 d c2 | e4 e8 f g4 a | g4 f e2 
\repeat volta 2 {
e8 e e f g g f e | d8 d d e f f e d | e4 a g2 | f4 g8 f e2
} 
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
c4 c8 d e4 f | e4 d c2 | c4 c8 d e4 f | e4 d c2 |
\repeat volta 2 {
c8 c c d e e d c | b8 b b c d d c b | c4 f e4.( c8) | d4 e8 d c2
} 
} 

lyricA = \lyricmode {
Ant kal -- no kar -- klai siū -- ba -- vo,
Ant kal -- no kar -- klai siū -- ba -- vo,
Ant kal -- no kar -- klai siū -- ba -- vo,
Pa -- kal -- nėj van -- duo liū -- lia -- vo,
Liū -- lia -- vo liū -- lia -- vo.

} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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
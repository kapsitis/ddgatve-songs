\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, vonogi, vanadzeni"
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
\key f \major
\time 2/4
\repeat volta 2 {
f4. a8 | g8 f e d 
}
\alternative { { c4( d8) e } { c4. r8 } }
\repeat volta 2 {
c'4.\fermata c8 | c8 c d c | bes8 a g g | g8 g c bes | a2
}
} 

lyricA = \lyricmode {
Ai, vo -- no -- gi, va -- na -- dze -- ni, dzen'.
Ai, vo -- no -- gi, va -- na -- dze -- ni,
Kam tik aug -- ši li -- di -- niej’?
} 


voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {
s2 | s2
}
\alternative { { s2 } { s2 } }
\repeat volta 2 {
a'4. a8 | a8 a bes a | g8 f e e | e8 e a g | a2
}
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



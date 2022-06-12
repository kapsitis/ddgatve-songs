\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nelīst lietus, nelīst lietus"
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
\key a \minor
\time 3/4
bes'4.^"runājoši" a8 g a | 
\time 2/4
bes8 a g a
\time 3/4
bes4 a2 
bes8[ a] g2
c4. b16[ a] c8 c |
\time 2/4
c8 b b a
\time 3/4
b4 a2 | a4. g8 c c 
\time 2/4
c8 b b a
\time 3/4
b4 a2
\bar "|."
} 


lyricA = \lyricmode {
Ne -- līst' lie -- tus, ne -- līst' lie -- tus,
lī -- go, lī -- go, 
šo -- dien lie -- tus ne -- va -- ja -- ga, 
lī -- go, 
šo -- dien lie -- tus ne -- va -- ja -- ga, 
lī -- go! 
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




\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nosarūca lāču māte",AA lapas, Šūpuļdziesmas
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
\key d \minor
\time 3/4
f4. e8 d c |
\time 2/4
d8 a a a |
d8 d d e |
\time 4/4
f4 f8( g) a4. g8 |
\time 2/4
f8 f e e |
\time 4/4
g4 e d2 |
\bar "|."
} 

lyricA = \lyricmode {
Lē -- ni, lē -- ni Die -- viņš brau -- ca no kal -- ni -- ņa le -- ji -- ņā -- i, no kal -- ni -- ņa le -- ji -- ņā.  
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Veļu upe pārplūdus'",AA lapas, Šūpuļdziesmas
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
b8 d d b |
e8 d d4\fermata |
b8 d d b |
e8 d d4\fermata |
c8 c b b |
\slurDashed
a8 a b( b)\fermata |
c8 c b b |
a8 a b4 |
\bar "|."
} 

lyricA = \lyricmode {
Ve -- ļu u -- pe pār -- plū -- dus', no kras -- tie -- mi iz -- gā -- jus',
ve -- ļu u -- pe pār -- plū -- dus', no kras -- tie -- mi iz -- gā -- jus'.
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



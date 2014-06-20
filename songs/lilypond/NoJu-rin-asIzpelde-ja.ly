\version "2.13.16"
%\header {
%    title = "No jūriņas izpeldēja duj dzelteni kumeliņi",Budēlīši, jūra
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
\time 6/4
c'8 d e[ d] c4 e8 f g4 g |
\time 14/4 
f8 g d4 g, e'( d8) d c8[ g'] g4 f8 g d4 g, e'4( d8) d c2 | 
\bar "|."
} 

lyricA = \lyricmode {
No jū -- ri -- ņas iz -- pel -- dē -- ja duj dzel -- te -- ni ku -- me -- li -- ņi, duj dzel -- te -- ni ku -- me -- liņ'.
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



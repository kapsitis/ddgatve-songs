\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Gaismeņa ausa"
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
\time 6/8
c8 c e g4 g8 | a8 g f e4 g8 |
d8 d c e4 e8 | f16[ e] d8 d e8.[ g16] e8 |
d8 d c e4 e8 | f16[ e] d8 d c4 c8 
\bar "|."
} 



lyricA = \lyricmode {
Gais -- me -- ņa au -- sa, sau -- lei -- te lē -- ce,
Oi, ag -- ri, ag -- ri sau -- lei -- te lē -- ce,
Oi, ag -- ri, ag -- ri sau -- lei -- te lē -- ce.
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



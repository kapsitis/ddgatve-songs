\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kur gaismena zaļa ausa"
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
\repeat volta 2 {
\time 2/4
f8 e d f |
e8 d c c |
f8 f a f |
g4 g |
g8 g g bes |
a8 g f d |
f8 f g e |
d4 d |
}
} 


lyricA = \lyricmode {
Kur gais -- me -- ņa za -- ļa au -- sa, tī sau -- lei -- te lē -- ce,
kam muo -- se -- ņa skais -- ta au -- ga, tī tau -- te -- nis brau -- ce.
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




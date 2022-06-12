\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jūriņāi trīs bandziņas"
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
\time 2/4
c8 c c c |
c8 c c c |
c8 c c c |
\time 4/4 
d4 b c d |
\time 6/4 
e4 e e( d) c2 |
e4 g f( e) d2 |
c4 b c( d) e2 |
d4 b c1 |
\bar "|."
} 


lyricA = \lyricmode {
Jū -- ri -- ņā -- i trīs ban -- dzi -- ņas, vi -- sām tri -- jām vār -- du zi -- nu,
jū -- ri -- ņā -- i trīs ban -- dzi -- ņas, vi -- sām tri -- jām vār -- du zin'.
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




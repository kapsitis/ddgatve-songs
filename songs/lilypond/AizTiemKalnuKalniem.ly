\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aiz tiem kalnu kalniem"
%}
%#(set-global-staff-size 18)
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


voiceA = \relative c'' {
\clef "treble"
\key a \minor
\time 4/1
a4 a f' f e4.( g8) f2 e4 e d c8[ b] a1 |
c4 c d d c( b8)[ a] g4 g c c b8[ c] d4 a2 a |
f'4 f e8[ d] e4 d c8[ b] a4 a c c b8[ c] d4 a2 a2
\bar "|."
} 

lyricA = \lyricmode {
Aiz tiem kal -- nu kal -- niem
Ka -- ri ka -- ro -- jās.
Aiz tās za -- ļās bērzu bir -- zes
pui -- sī -- ti no -- šā -- va;
Aiz tās za -- ļās bēr -- zu bir -- zes
pui -- sī -- ti no -- šā -- va.
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



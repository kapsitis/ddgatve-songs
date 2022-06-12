\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sniegi, vēji putinēja"
%}
% F/g "Laiva", rokraksts - laivas_pasakums.pdf, p.8
% Berta Rihters, dz. 1876.g. Sarkanā muižā, p. E.M. 1932, IIId. 1008
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
\time 2/4
\clef "treble"
\key a \minor
\time 3/4
d8 c d4 d | a8 b c[ b] a4 | a'8 g a4 a | g8 f e4 a8[ g] |
f8 e d[ c] d4 | a8 b c[ b] a4 | d8 c8 d4 e | f8 e d2
} 


lyricA = \lyricmode {
Snie -- gi, vē -- ji pu -- ti -- nē -- ja, 
bal -- ti jā -- ja ka -- ra -- vī -- ri, 
Snie -- gi, vē -- ji pu -- ti -- nē -- ja, 
bal -- ti jā -- ja ka -- ra -- vīr'.
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



\version "2.13.16"
%\header {
%    title = "Snieg sniedziņis, putināja"
%}
% F/g "Laiva", rokraksts - laivas_pasakums.pdf, p.2
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
\time 2/4
g8 e' e8. d16 | c16[ d] e8 e e | 
f8 f16[ g] a[ g] f8 | e8.[ f16] e8[ c] | 
d8 e d( e16) d | c8. b16 a8 b | c8 b16[ c] b8 a | b2
} 


lyricA = \lyricmode {
Snieg snie -- dzi -- ņis pu -- ti -- nā -- ja, 
ai -- jā, pu -- ti -- nā -- ja, 
lau -- kā ma -- nis ku -- me -- li -- ņis, 
ai -- jā, ku -- me -- liņš. 
} 

chordsA = \chordmode {
\time 4/4
a1:m | d2:m | a2:m | d2:m | a1:m | e2:5 
}


fullScore = <<
\new ChordNames { \chordsA }
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



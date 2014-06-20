\version "2.13.16"
%\header {
%    title = "Kad vecais Marčs"
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
\key d \major
\time 2/4
\partial 8
a8  
\repeat volta 2 {
d8\fermata d a a  | d8 d a a  |
d8 cis d fis | \slurDashed  a8 a16( a)  r8 fis |
g8 g e e | fis8 fis d d |
e8 e cis a 
}
}

lyricAA = \lyricmode {
\set stanza = #"1."
Kad ve -- cais Marčs uz me -- žu iet, pār ple -- cu li -- cis šķi -- pe-li,
Viņš me -- ža ma -- lā no -- stā -- jas un iz -- velk sa -- vu...
}

lyricAB = \lyricmode {
\set stanza = #"2."
_ Pī -- pes kā -- ta gal -- vi -- ņu, ko iz -- kra -- ta uz e -- žas,
Un di -- vas mei -- tas smai -- do -- šas tam rā -- da sa -- vas... 
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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



\version "2.13.16"
%\header {
%    title = "Mārtiņš kūra uguntiņu ",Laivas lapas,Mārtiņi
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
\time 2/4
f8 e d d |
a8 a d e |
f8 f e e |
d8 c d4 |
f4 g8[ bes] |
a8 f e4 |
f8 f e e |
d8 c d4 |
\bar "|."
}

lyricA = \lyricmode {
  Mār -- tiņš kū -- ra u -- gun -- ti -- ņu un Kat -- rī -- na ga -- ļu cep;
  ē, ēē, ai -- ja -- jā, un Kat -- rī -- na ga -- ļu cep.
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



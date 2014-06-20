\version "2.13.16"
%\header {
%    title = "Kur gaismeņa zyla ausa"
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
\slurSolid
e8 g fis b, | e16[( fis]) g8 fis b, | e8 fis g a | 
\slurDashed
b8( b) b4 
\repeat volta 2 { 
\slurSolid
d8 b c c | b b a a16[( c]) | b8 a g fis | 
\slurDashed
e8[( e]) e4
}
} 



lyricA = \lyricmode {
Kur gais -- me -- ņa zy -- la au -- sa,
Tī sau -- lei -- te lē -- ce;
Kam muo -- se -- ņa skais -- ta au -- ga,
Tī tau -- te -- nis brau -- ce.
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



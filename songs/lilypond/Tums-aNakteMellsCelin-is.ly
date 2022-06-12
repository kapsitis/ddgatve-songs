\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumša nakte mells celiņis, mellu jūdzu kumeliņu"
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
\time 3/4
\repeat volta 2 {
g8 b d4 g |
fis8 e d8.[ c16] b4 |
e8 d a8.[ b16] c4 |
}
\alternative { {b8 a g4 a | } {b8 a g2 | } }

} 

lyricA = \lyricmode {
Tum -- ša nak -- te mells ce -- li -- ņis, mel -- lu jū -- dzu ku -- me -- li -- ņu, ku -- me -- liņ.
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



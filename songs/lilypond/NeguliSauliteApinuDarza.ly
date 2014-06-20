\version "2.13.16"
%\header {
%    title = "Neguli, Saulīte, apiņu dārzā"
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
\key a \minor
\time 3/8
\phrasingSlurDashed
\phrasingSlurDown
d8 d\( d\) | c16[ b] a8 a | d8 d e | f8 e4 |
e8 a\( a\) | g16[ fis] e8 e | f!8 e c | d8 d4 
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 3/8
d16 d16 s4 | s4. | s4. | s4. | e16 e16 s4 | s4. | s4. | s4.
}

lyricA = \lyricmode {
Ne -- gu -- li, Sau -- lī -- te, a -- pi -- ņu dār -- zā, 
Ne -- gu -- li, Sau -- lī -- te, a -- pi -- ņu dār -- zā. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



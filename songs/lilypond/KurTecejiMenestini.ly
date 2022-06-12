\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kur tecēji, Mēnestiņi"
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
\key e \minor
\time 2/4
g'8 g fis fis | g8 g fis fis | g8 g a g| a8 fis e4 |
e8 d e e | d8 d e4
} 

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
s2 | s2 | s2 | s4 e4~ | e2~ | e2
} 


lyricA = \lyricmode {
Kur te -- cē -- ji, Mē -- nes -- ti -- ņi 
ar to zvaig -- žņu pu -- du -- rīt', 
ar to zvaig -- žņu pu -- du -- rīt'?
}

lyricB = \lyricmode {
Ē __ _
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceB" \lyricB
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



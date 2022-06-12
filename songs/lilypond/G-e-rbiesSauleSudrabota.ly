\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Ģērbies, Saule, sudrabota"
%}
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 5/8
g'8 e g4 c8 | a8 f a4 d8 | b8 g b4 d8 | d8 b c4. |
g8 e' e4 e8 | e16[ d] f8 d4 c8 | b8 d d4 e8 | d8 c c4. 
}


lyricA = \lyricmode {
Ģēr -- bies, Sau -- le, sud -- ra -- bo -- ta, nu brauc ta -- vi pre -- ci -- niek',
Ģēr -- bies, Sau -- le, sud -- ra -- bo -- ta, nu brauc ta -- vi pre -- ci -- niek'!
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



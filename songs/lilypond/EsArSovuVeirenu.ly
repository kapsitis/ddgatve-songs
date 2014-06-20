\version "2.13.16"
%\header {
%    title = "Es ar sovu veireņu"
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

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
a8 a a b | a4 fis8 fis | g4 e | d4 d 
}
\repeat volta 2 {
e8 e e e | fis8 fis fis fis | g4 e | d4 d
}
} 



lyricA = \lyricmode {
Es ar so -- vu vei -- re -- ņu_- rei -- zē, rei -- zē.
Jis iz dor -- bu, es iz cep -- ļa_- rei -- zē, rei -- zē.
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



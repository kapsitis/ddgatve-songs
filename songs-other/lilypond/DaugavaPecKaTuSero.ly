\version "2.13.16"
%\header {
%    title = "Daugava, pēc kā tu sēro"
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
\key c \major
\time 3/4
e8. e16 f4 d | f8. f16 e4 d | c8. e16 a4. g8 | g8. fis16 g4~ g
\repeat volta 2 {
g8. g16 c8.( b16) a4 | a8. a16 g4 e | c8. e16 g4. e8 | d8. d16 c4~ c
} 
} 

lyricA = \lyricmode {
Dau -- ga -- va, pēc kā tu sē -- ro, 
kam -- dēļ ta -- vi viļ -- ņi vaid? 
It kā no -- ziedz -- nie -- ki ķē -- dēs 
at -- sva -- bi -- nā -- ša -- nu gaid'.
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


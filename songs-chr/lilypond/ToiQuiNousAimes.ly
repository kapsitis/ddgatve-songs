\version "2.13.16" 
%\header {
%    title = "Toi qui nous aimes"
%}
% Chants de Taizé, #5
\paper {
line-width = 10\cm
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
\key g \minor
\time 4/4
\repeat volta 2 { 
g'4^\markup { \circle \bold A } \times 2/3 { g8( a) bes } c4 a | 
bes8^\markup { \circle \bold B } bes c d ees c d d | 
bes4^\markup { \circle \bold C } a8 g g4 fis | g8 f! ees d c ees d d
}
} 




lyricA = \lyricmode {
Toi qui nous ai -- mes, ton par -- don et ta pré -- sen -- ce en nous font naî -- tre la clar -- té de la lou -- an -- ge.
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



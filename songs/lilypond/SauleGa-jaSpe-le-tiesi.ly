\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Saule gāja spēlētiesi ar to jūras ūdentiņ'"
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
c8 d e4 e |
f8 e d2 |
b8 c d4 f |
e8 f g2 |
g8 f e[ d] c4 |
g'8 g a2 |
g8 f e4 c |
f8 f e2 |
f8 f e4 c |
g'8 b, c2 |
\bar "|."
} 


lyricA = \lyricmode {
Sau -- le gā -- ja spē -- lē -- ties ar to jū -- ras ū -- den -- tiņ',
Sau -- le gā -- ja spē -- lē -- ties ar to jū -- ras ū -- den -- tiņ', ar to jū -- ras ū -- den -- tiņ'.
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




\version "2.13.16"
%\header {
%    title = "Dieviņš bija, Dievs palika",AA lapas
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
\time 2/4
e8. c16 e8 e |
d8 c d8. e16 |
f8 f f g |
f8 e e8. d16 |
e8. c16 e8 e |
d8 c d4 |
g8 f e d |
c8 b c4 |
\bar "|."
} 

lyricA = \lyricmode {
Die -- viņš bi -- ja, Dievs pa -- li -- ka, Die -- vam gud -- ris pa -- do -- mi -- ņis;
Die -- viņš bi -- ja, Dievs pa -- lik, Die -- vam gud -- ris pa -- do -- miņš:
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



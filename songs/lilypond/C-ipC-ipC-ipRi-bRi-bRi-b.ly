\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Čip, čip, čip, rīb, rīb, rīb",AA lapas
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
\key d \major
\repeat volta 2 {
\time 2/4
\slurDashed
fis8 fis d( d) |
\slurDashed
g8 g e( e) |
cis8 cis a a |
d8 d d4 |
}
} 

lyricA = \lyricmode {
Čip, čip, čip, rīb, rīb, rīb, kas pa me -- žu rī -- bi -- nāj'.
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tuoli dzeivoj muna meiluo"
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
\key fis \minor
\time 2/4
a8. a16 e8 a16[ gis] | fis8 fis cis cis |
cis'8. b16 a a gis gis | a8[( b cis d]) |
cis8. cis16 b8 cis16[ b] | fis8 fis cis cis |
cis'8. b16 a a gis gis | fis2
\bar "|."
} 

lyricA = \lyricmode {
Tuo -- li dzei -- voj mu -- na mei -- luo,
Es na -- va -- ru sa -- sa -- tikt.
Tuo -- li dzei -- voj mu -- na mei -- luo,
Es na -- va -- ru sa -- sa -- tikt.
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




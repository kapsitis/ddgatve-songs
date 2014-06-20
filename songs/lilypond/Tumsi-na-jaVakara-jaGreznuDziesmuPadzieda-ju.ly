\version "2.13.16"
%\header {
%    title = "Tumsīnāja vakarāja",AA lapas, Gavilējamā dz.
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
\time 6/8
fis4 e8 dis16[ cis16] e4 |
\time 5/8 
fis8  fis g16[ fis16] fis4 |
fis8 g dis e4 |
g8 e g fis4 |
fis8 e dis8 e4 |
\bar "|."
} 

lyricA = \lyricmode {
Tum -- sī -- nā -- ja va -- ka -- rā -- ja grez -- nu dzies -- mu pa -- dzie -- dā -- ju, grez -- nu dzies -- mu.
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



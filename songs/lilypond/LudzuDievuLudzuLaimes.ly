\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lūdzu Dievu, lūdzu Laimes"
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
\key g \major
\time 4/4
d4 d8[ e] fis4 fis  | fis8[ g] fis[ e] d4 d |
a'4 a a8[ g] fis4 | e8[ fis] g4 fis2 |
a4 a b8[ a] g4 | a8[ g] e4 fis2 
\bar "|."
} 

lyricA = \lyricmode {
Lū -- dzu Die -- vu, lū -- dzu Lai -- mes, A -- bi di -- vi
lī -- dza lūdz', A -- bi di -- vi lī -- dza lūdz'.
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




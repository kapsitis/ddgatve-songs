\version "2.13.16"
%\header {
%    title = "Labvakari, rudzu laukis"
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


voiceA = \transpose aes a { \relative c' {
\clef "treble"
\key aes \minor
\time 4/4
aes4 des ces des \time 6/4 
ees4.( des8 ees4) ges fes ees \time 4/4
des4 des ces des |
ees2( des4) ces |
aes4( ees' des) ces8[ bes]

aes4 des ces des \time 6/4 
ees4.( des8 ees4) ges fes ees \time 4/4
des4 des ces des |
ees2( des4) ces |
aes4( ees' des) ces8[ bes]
\bar "|."
} }

lyricA = \lyricmode {
Lab -- va -- ka -- ri, ru -- dzu  lau -- kis, 
kā Die -- vi -- ņis Tev lī -- dzē -- ja, 
Kā Die -- vi -- ņis Tev lī -- dzē -- ja 
pe -- lēks zie -- dus no -- zie -- dē -- ti.
}

voiceB = \transpose aes a { \relative c'' {
\clef "treble"
\key aes \minor
\time 4/4
s1 \time 6/4
s1. \time 4/4
ges4 ges ces bes | aes4 bes2( aes4) | aes4( bes2) aes4~ |
aes1 \time 6/4
ges2( aes4) aes aes aes \time 4/4
aes4 ges ges ges |
ges2( aes4) aes4 |
ges4( ges aes) ges |
\bar "|."
} }


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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



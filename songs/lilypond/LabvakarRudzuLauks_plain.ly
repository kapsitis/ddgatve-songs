\version "2.13.18"
#(ly:set-option 'crop #t)

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


voiceA = \relative c' {
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
} 

lyricA = \lyricmode {
Lab -- va -- ka -- ri, ru -- dzu  lau -- kis, 
kā Die -- vi -- ņis Tev lī -- dzē -- ja, 
Kā Die -- vi -- ņis Tev lī -- dzē -- ja 
pe -- lēks zie -- dus no -- zie -- dē -- ti.
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



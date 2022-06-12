\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Projām, projām, pie Veļu mātes",AA lapas, veļu laiks
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
\slurDashed
e4 d8( d) |
e4 d8( d) |
e4 d8 c |
e4 d |
\bar "|."
} 

lyricA = \lyricmode {
Pro -- jām, pro -- jām, pie Ve -- ļu mā -- tes!

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



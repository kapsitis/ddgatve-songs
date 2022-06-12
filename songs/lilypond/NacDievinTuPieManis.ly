\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nāc, Dieviņ, tu pie manis"
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
\key a \minor
\time 2/4
c'8 g g g | c8 g g g |
c8 b c b | c8 g g g |
a8 a c g | a8 a a a |
c8 b c b | c8 a a4 |
c8 a a a | g8 g a4\fermata
\bar "|."
} 

lyricA = \lyricmode {
Nāc, Die -- vi -- ņi, tu pie ma -- nis 
Šo va -- ka -- ru va -- ka -- rē -- ti! 
Nāc, Die -- vi -- ņi, tu pie ma -- nis 
Šo va -- ka -- ru va -- ka -- rēt,
Šo va -- ka -- ru va -- ka -- rēt.
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




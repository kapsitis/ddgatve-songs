\version "2.13.16"
%\header {
%    title = "Ekur stalti karavīri"
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
\key b \minor
\time 5/4
\repeat volta 2 {
d4 e fis8. e16 d8 e b a 
}
\time 2/4
a8 a16[ g] fis8 a |
a8 d b d |
a8 a16[ g] fis8 a |
a8 d b4\fermata
\bar "|."
} 

lyricA = \lyricmode {
E -- kur stal -- ti ka -- ra -- vī -- ri, 
Ma -- ni bal -- ti bā -- le -- li -- ņi, 
Ma -- ni bal -- ti bā -- le -- liņ'.
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




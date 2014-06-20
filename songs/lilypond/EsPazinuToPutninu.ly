\version "2.13.16"
%\header {
%    title = "Es pazinu to putniņu"
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
\key f\major
\time 3/4
\repeat volta 2 {        
f2 g4 | a2 bes8[ a] | g2 g4 
}
\alternative { {f2 c4} {f2.} }
} 

lyricA = \lyricmode {
Es pa -- zi -- nu to put -- ni -- ņu niņ.
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





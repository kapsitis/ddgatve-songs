\version "2.13.16"
%\header {
%    title = "Tinu, tinu kamoliņu"
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
\repeat volta 2 {
c8 e e g | g8 f f f | d8 f f a | a g g g 
}        
\time 4/4
\repeat volta 2 {
c4 b c8 a g f | e4 d c2  
}
} 


lyricA = \lyricmode {
Ti -- nu, ti -- nu ka -- mo -- li -- ņu 
ko sa -- tī -- šu ne -- vēr -- pu -- si.
Trai, rai ri -- di -- ri -- di ral -- la -- lā. 
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



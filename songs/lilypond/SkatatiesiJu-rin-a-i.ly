\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Skatatiesi jūriņāi",AA lapas
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
\key a \major 
\time 2/4
a8 b cis d |
e8 e e e |
a4 b |
a8[ fis] e4 |
\repeat volta 2 {
\time 2/4
e8 a cis, e |
e8 d cis b |
\time 4/4 |
a4 b a2 |
}
} 

lyricA = \lyricmode {
Ska -- ta -- tie -- si jū -- ri -- ņā -- i, ē ē, ai -- jā,
kā -- di bal -- ti au -- dek -- li -- ņi, trai -- rai -- rā. 
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



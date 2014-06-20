\version "2.13.16"
%\header {
%    title = " Divi bija, divi bija ",Laivas lapas,Ziema
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


chordsA = \chordmode {
\time 2/4
d2:m | d2:m | d2:m | d2:m | d2:m | 
d2:m | d2:m | d2:m | d2:m | d2:m | 
}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
%MS
c8 c d d |
d8 c d4 |
c8 d c c |
d8 c d4 |
%ME
c8 c f f |
f8 e d4 |
f8 f f e |
d8 c d4 |
c8 e f f |
f8 e d4 |
\bar "|."
}

lyricA = \lyricmode {
 Di -- vi bi -- ja, di -- vi bij' sal -- tas zie -- mas cie -- tē -- jiņ',
 di -- vi bi -- ja, di -- vi bij' sal -- tas zie -- mas cie -- tē -- jiņ', sal -- tas zie -- mas cie -- tē -- jiņ'.
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



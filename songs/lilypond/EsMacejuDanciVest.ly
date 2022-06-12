\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es mācēju danci vest"
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
\key c\major
\time 2/4
g8 e' e8. e16 | g,8 e' e r | 
e8. f16 g8. c,16 | e8 d d r |
g,8 d' d8. d16 | g,8 d' d r | 
d8. e16 f8. b,16 | d8 c c4 |
e8. g16 c8. e,16 | g8 f f f | 
d8. f16 b8. d,16 | f8 e e4 | 
e8. g16 c8. e,16 | g8 f f f | 
a8. g16 f8. b,16 | d8 c c4  
\bar "|."
}


lyricA = \lyricmode {
Es mā -- cē -- ju dan -- ci vest 
lī -- ku -- mi -- ņu  lī -- ku -- miem,
Es mā -- cē -- ju dan -- ci vest
lī -- ku -- mi -- ņu  lī -- ku -- miem.
Au -- dek -- li -- ņu ne -- mā -- cē -- ju, 
tas te -- cē -- ja čo -- ku -- rā.
Au -- dek -- li -- ņu ne -- mā -- cē -- ju, 
tas te -- cē -- ja čo -- ku -- rā. 
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



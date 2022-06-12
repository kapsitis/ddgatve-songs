\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Liela diena, Saule
% Es bij' viens kuplis koks
\layout {
indent = #0
ragged-last = ##f
}



chordsA = \chordmode {
\time 2/4
a2:m | d4:m a4:m | a2:m | d4:m a4:m |
a4:m e4:m | a4:m d4:m | e2:m | a2:m |
}

voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
\slurDashed
a'8 a e( e)|
\slurDashed
f8 d e( e)|
\phrasingSlurDashed
a8 a e\( e\)|
\phrasingSlurDashed
f8 d e\( e\)|
\slurDashed
a8 a b( b) |
c8 c d4 |
e8 c b b |
a8 a a4 |
\bar"|."
}




lyricA = \lyricmode {
Es bij' viens kup -- lis koks, man bij' put -- nu pil -- ni za -- ri, 
es bij' viens kup -- lis koks, man bij' put -- nu pil -- ni zar'.
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



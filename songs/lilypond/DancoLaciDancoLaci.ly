\version "2.13.16"
%\header {
%    title = "Danco, lāci, danco, lāci"
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
\time 4/4
d1:5 | d1:5 | a1:5 | d1:5 |
\time 2/4 
\repeat volta 2 {
d2:5 | d2:5 | d2:5 | d2:5 | 
}
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4
%MS
d4 d fis fis | d d fis fis | e4 e a, a | 
%ME
d4 d d2
\time 2/4
\repeat volta 2 {
a'8 a a fis | a8 a a fis | g8 g e e | d8 d d4
}
} 

lyricA = \lyricmode {
Dan -- co, lā -- ci, dan -- co, lā -- ci, 
sai -- me -- nie -- ce aiz -- mak -- sās:
Svies -- ta ci -- bu, mai -- zes kan -- ci, 
di -- vi sie -- ki dāl -- de -- rīš'.  
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




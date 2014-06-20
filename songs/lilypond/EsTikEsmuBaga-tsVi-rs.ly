\version "2.13.16"
%\header {
%    title = "Es tik esmu bagāts vīrs",AA lapas, Jāņi
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
\repeat volta 2 {
c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | 
}
\repeat volta 2 {
c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | 
}
\repeat volta 2 {
c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | c2:5 |  
}  
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\repeat volta 2 {
\time 2/4
c8 e e e |
e8 d c4 |
e8 d c4 |
c8 e e e |
e8 d c4 |
e8 d c4 |
}

\repeat volta 2 {
e8 g g g |
g8 f e4 |
g8 f e4 |
e8 g g g |
g8 f e4 |
g8 f e4 |
}

\repeat volta 2 {
e8 g g g |
g8 f e e |
e8 g g g |
g8 f e e |
e8 g g g |
g8 f e e |
e8 g g g |
g8 f e4 |
} 
}

lyricA = \lyricmode {
 Es tik es -- mu ba -- gāts vīrs, ba -- gāts vīrs:
Man put -- ni -- ņi dies' un gan', dies' un gan'.
Bet es es -- mu na -- ba -- dziņš, na -- ba -- dzinš: Man put -- ni -- ņu ma -- zu -- mā,
 ma -- zu -- mā,
Es tev lū -- dzu, ba -- jā -- rī -- ti, dod man vie -- nu pa -- za -- rī -- ti,
ja ne -- do -- si pa -- za -- rī -- ti, no -- lau -- zī -- šu ga -- lot -- nīt'.
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







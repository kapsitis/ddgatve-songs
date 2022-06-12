\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jānīts jāja visu gadu"
%}
% Katrīna Riekstiņa, #51 (Iļģi)
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
\time 4/4
\repeat volta 2 {
c8 c c c d d c b | b4 c d c |
c8 c c c d d c b | b4 c d c |
}
} 

lyricA = \lyricmode {
Jā -- nīts jā -- ja vi -- su ga -- du, lī -- go, lī -- go, 
nu at -- jā -- ja šo -- va -- ka -- ri, lī -- go, lī -- go.  
}

chordsA = \chordmode {
\time 4/4
c1:5 | g1:5 | c1:5 | g2:5 c2:5 |
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




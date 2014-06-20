\version "2.13.16"
%\header {
%    title = "Čigāniņa dēliņš biju"
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
c2:5 | c2:5 | c2:5 | g2:5 | 
g2:5 | g2:5 | g2:5 | c2:5 | 
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 { 
%MS
e8 g g g |
e8 g g g |
g8 g c e, |
%ME
e8 d d4 |
b8 d d d |
b8 d d d |
b'8. a16 b8. a16 |
a8 g g4 |
}
} 

lyricAA = \lyricmode {
Či- gā- ni- ņa dē- liņš bi- ju, 
mel- nu zir- gu jā- jē- jiņš,
Či- gā- ni- ņa dē- liņš bi- ju, 
mel- nu zir- gu jā- jē- jiņš.
}

lyricAB = \lyricmode {
I- ku ši- ku pā- di ra- sā 
pid- rid ri- kum ai- džin- džal,
Ai- da dul- la, ai- da dul- la, 
ā- re mū- re ral- lal- lā.
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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




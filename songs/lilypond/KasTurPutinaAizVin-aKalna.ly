\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tur putina aiz viņa kalna",AA lapas, Ziemassvetki
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
\time 6/8
c2.:5 | c2.:5 |
\repeat volta 2 {
c2.:5 | f4.:5 c4.:5 | 
}
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 6/8
c4 d8 e d c |
e8 g g g e4 |
\repeat volta 2 {
g8 g e g g e |
f8 e[ d] d c4 |
}
} 

lyricA = \lyricmode {
Kas tur pu -- ti -- na aiz vi -- ņa kal -- na? Ziems -- svēt -- ki pu -- ti -- na at -- nāk -- da -- mi.
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



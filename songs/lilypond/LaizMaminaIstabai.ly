\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Laiž, māmiņa, istabāi"
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
a2:m | a2:m | a2:m | a2:m |
}
\repeat volta 2 {  
a2:m | a2:m | a2:m | a2:m | a2:m |
}
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
\repeat volta 2 {
a'8 e' e e | d8 f e4 |
a,8 c e~ e | d8 d a4 |
}
\repeat volta 2 {
e'2 | d8 d d d |
c8 e e4 | a,8 c e e |
d8 d a4
}
}

lyricA = \lyricmode {
Laiž, mā -- mi -- ņa, is -- ta -- bā,
ne -- ba mēs daudz bi -- jām, 
ē, in din din din dil -- lal -- lā,
da -- ha, da -- ha, dal -- lal -- lā.
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



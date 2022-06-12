\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = " Adat, meitas, ko adat ",Laivas lapas
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
a2:m | a2:m | d2:m | d2:m | d2:m | d2:m | d2:m | d2:m | d2:m | d2:m |
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
%MS
e8 c c c |
d8 c c4 |
%ME
c8 f f f |
f8 e d4 |
a8 d d d |
d8 d d4 |
f8 f f d |
f8 e d4 |
a8 d d d |
d8 d d4 |
\bar "|."
}

lyricA = \lyricmode {
A -- dat, mei -- tas, ko a -- dat, vil -- kam ze -- ķes no -- a -- dat, a -- dat, mei -- tas, ko a -- dat,
vil -- kam ze -- ķes no -- a -- dat, vil -- kam ze -- ķes no -- a -- dat.
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ganu es aitiņas"
%}
%#(set-global-staff-size 18)
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
\time 3/8
d4.:m | d4.:m | d4.:m | d8:m a4:5 | 
a4.:5 | d4.:m | d4.:m | a8:5 d4:m | 
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 3/8
d8 f g | f8 e d | f8 g a | bes8 a4 |
a8 g f | g8 d d | a'8 f f | e d4
\bar "|."
} 

lyricA = \lyricmode {
Ga -- nu es ai -- ti -- ņas liel -- ce -- ļa ma -- lā; 
La -- pi -- ņas čauk -- stē -- ja, krū -- mi -- ņi brik -- šķēj'.
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




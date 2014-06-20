\version "2.13.16"
%\header {
%    title = "Kur tu teci ruda pele?",AA lapas, Jāņi
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
f2:5 | f2:5 | f2:5 | f2:5 |
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {
a'8 f f f |
\phrasingSlurDashed
f8 f f\( f\) |
c4 f |
f4 f |
}
} 

lyricA = \lyricmode {
Kur tu te -- ci, ru -- da pe -- le ro -- tā, ro -- tā?
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



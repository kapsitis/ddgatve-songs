\version "2.13.18"


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
a2.:min e a:min g c g a4:min f d:min e2. a4:min d:min e a2.:min
}

voiceA = \relative c''{
\clef "treble"
\key a \minor
\time 3/4

\repeat volta 2 { a4 a a | gis8 fis gis2 | a4 a a | b8 a b2 | c4 c r | b b r |} 
\alternative {
{ c4 c d | b2. }
{ a4 a gis | a2. \bar"|." }
}
}

lyricA = \lyricmode {
Lau -- da -- te Do -- mi -- num, lau -- da -- te Do -- mi -- num, om -- nes gen -- tes Al -- le -- lu -- ia. Al -- le -- lu -- ia.
}


fullScore = <<
\new ChordNames { \chordsA }
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}
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
a2:min d:min e:7 a:min f g c e:7 a:min d:min e:7 a:min f g c e:7 c1
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4

\repeat volta 2 {c2 d | e4 (d) c2 | a'4 a g d | e4. f8 e4 d | c2 d | e4 (gis) a2 | c4 a g d } 
\alternative {
	{c2 b}
	{c2 c}
}
}

lyricA = \lyricmode {
Jē -- zu, Jē -- zu, lēns un pa -- ze -- mī -- gu sir -- di.
Jē -- zu, Jē -- zu, dod mums Sē -- to Ga -- ru! Ga -- ru!
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



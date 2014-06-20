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
fis1 cis fis b cis fis cis fis
}

voiceA = \relative c'{
\clef "treble"
\key fis \major
\time 4/4

\repeat volta 2 { fis16 gis ais8 ais16 b cis8 cis4 fis, | gis8 gis gis16 ais b8 ais2 }
cis b8 ais gis [(fis]) | dis'2 cis8 b ais [(gis]) | gis [(ais]) gis fis gis4 ais8 [(b]) | b cis cis2. | gis8 (ais gis fis) gis4 eis | fis1 \bar "|."
}

lyricA = \lyricmode {
Aug - sti sla - vē Kun -- gu ma -- na dvē - se -- le Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat, Mag -- ni -- fi -- cat.
}
lyricB = \lyricmode {
un mans gars ga -- vi -- lē Die -- vā, ma -- nā Pes -- tī -- tā -- jā.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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
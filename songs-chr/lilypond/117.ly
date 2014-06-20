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
fis2.:min b4:min cis1 s4 fis4:min e2 a fis4:min b:min cis2 a4 b cis fis2:min a fis4:min b:min cis2 a4 b cis fis2:min
}

voiceA = \relative c' {
\clef "treble"
\key fis \minor
\time 3/4
%\dynamicUp

\repeat volta 2 {
cis8 cis cis cis cis4 | fis eis2 | eis8 eis eis eis eis4 | fis gis2 |
a8 a4 gis8 fis eis | fis4 eis2 | \time 2/4 cis8 cis dis fis | \time 3/4 eis4 fis2 |
cis'8 cis4 b8 a gis | fis4 eis2 | \time 2/4 cis8 cis dis fis | \time 3/4 eis4 fis2
}
}

lyricA = \lyricmode {
A -- do -- ra -- mus te Chris -- te, be -- ne -- di -- ci -- mus ti -- bi
qui -- a per cru -- cem tu -- am re -- de -- mis -- ti mun -- dum,
qui -- a per cru -- cem tu -- am re -- de -- mis -- ti mun -- dum.
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



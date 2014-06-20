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

%chordsA = \chordmode {}

voiceA = \relative c' {
\clef "treble"
\key e \major
\time 4/4

e8 e4 fis 8 gis4 gis | e8 e4 fis8 gis gis gis a | gis4 fis fis gis8 a | gis4 fis fis2|
dis8 dis4 e8 fis2 | dis8 dis4 e8 fis4 fis8 ([gis]) | fis4 e8 e e r fis ([gis]) | fis4 e8 e e4 r |
cis'8 cis4 cis8 cis4 cis8 cis | b4 gis8 ([fis]) e2 | cis'8 cis4 cis8 cis4 cis | b4 gis8 fis e2 |
e8 e4 fis8 gis gis gis a | gis2 fis | e1 \bar"|."
}

lyricA = \lyricmode {
Šī ir tā die -- na, šī ir tā die -- na, ku -- ru Kungs mums dod, ku -- ru Kungs mums dod,
prie -- cā -- si -- mies, prie -- cā -- si -- mies un līk -- smo -- si -- mies, un līk -- smo -- si -- mies.
Šī ir die -- na, ku -- ru Kungs mums dod, prie -- cā -- si -- mies un līk -- smo -- si -- mies.
Šī ir tā die -- na, ku -- ru Kungs mums dod.
}

fullScore = <<
%\new ChordNames { \chordsA }
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



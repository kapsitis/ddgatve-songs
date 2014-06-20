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
fis1.:min e1. e2 fis1.:min fis2 e1 cis2:min fis1
fis1.:min e1. e2 fis1.:min fis2 e1 cis2:min fis1
}

voiceA = \relative c' {
\clef "treble"
\key fis \minor
\time 4/4

fis8^\markup {\translate #'(-12 . 0) \italic Refrēns} fis4 cis8 fis2 | 
a8 [gis] fis4 e2 | e8 e4 b8 e2 | gis8 fis e4 fis2 |
fis8 fis4 cis8 fis2 | a8 [gis] fis4 e2 |e4 e cis e | fis1 \bar"||" \break

cis'4. b8 a4 a | b a gis2 | b4. a8 gis4 gis | a gis fis2 |
cis'4. b8 a4 a | b a gis2 | b4 a gis e | fis1 \bar"|."
}

lyricA = \lyricmode {
Nāc, Svē -- tais Gars, Ra -- dī -- tāj, stip -- ri -- ni mūs, mie -- ri -- ni mūs.
Dzī -- vī -- bas Gars, Die -- va Gars, mū -- su sir -- dīs nāc!
\set stanza = "1. "
Nāc, Gars, nāc, mūs ap -- cie -- mo, mū -- su sir -- dīs ie -- mā -- jo.
Nāc, Gars, nāc, mūs at -- jau -- no, Te -- vi gai -- dām mēs!
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "2. "
Svē -- tu -- mā mūs au -- dzi -- ni, pa -- tie -- sī -- bā stip -- ri -- ni,
Mī -- les -- tī -- bu dā -- vi -- ni, Te -- vi gai -- dām mēs!
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "3. "
Nāc, Gars, nāc, mūs ap -- vie -- no, nāc, Gars, nāc, mūs ap -- mī -- ļo.
Nāc, Gars, nāc, mūs ie -- dves -- mo, Te -- vi gai -- dām mēs!
}
fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



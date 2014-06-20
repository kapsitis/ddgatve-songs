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
s8 c1:min f:min bes es as f:min6 g:7 c:min c:min as bes es c:min f:min g:7 c:min
}

voiceA = \relative c''{
\clef "treble"
\key c \minor
\time 4/4
\partial 8

g8 | g4. g8 c bes as g | as2 r8 as bes c | bes2 r8 f bes as | g2. r8 es | es4. es8 as g f es | f2 r8 f g as | g2~ g8 d es d | c2. r4 \bar"||" \break|
es'4 es8 d es d es d | es2 r8 c d es | d2~ d8 c bes as | bes2. r4 | c4 c8 c c g c g | as2~ as8 c d c | b2~ b8 b c b | c2. r8 g \bar"|." 
}

lyricA = \lyricmode {
Ar Te -- vi ša -- jā ce -- ļā iet, kur sauc mūs Dievs, o, Ma -- ri -- ja. Ar Te -- vi ko -- pā Die -- vu sveikt, tam pre -- tī steigt, o, Ma -- ri -- ja.
\set stanza = "1. "
Ar Te -- vi ko -- pā Die -- vu teikt: 'Mag -- ni -- fi -- cat!' o, Ma -- ri -- ja. E -- jot caur dzī -- ves ik -- die -- nu pa ta -- ku to, ko gā -- ji Tu. Ar
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "2. "
Ko -- pī -- gi Jē -- zum lī -- dzi ciest Ģet -- se -- ma -- nē, o, Ma -- ri -- ja. Ko -- pī -- gi Vi -- ņa pē -- dās iet caur šo -- die -- nu uz mū -- žī -- bu. _
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "3. "
Teikt Die -- vam 'jā' no 'An -- ge -- lus' līdz Gol -- gā -- tai, o, Ma -- ri -- ja. Ko -- pā ar Te -- vi lūg -- ša -- nā smelt spē -- ku Ta -- vā ti -- cī -- bā. _
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
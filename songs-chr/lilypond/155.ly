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
e2. b4:7 e1 e2. a4 b1:7 e2 e:7 a2. b4:7 e2. b4:7 e1
}

voiceA = \relative c' {
\clef "treble"
\key e \major
\time 4/4

e2. fis8 fis | e1 | b'2. cis8 b | fis2. a4 |
gis4. a8 b4. b8 | cis8 cis a a e4 fis | gis2. fis8 fis | e1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Jē -- zus ir šeit. Jē -- zus ir šeit.
Mēs ce -- ļam ro -- kas, tei -- cam Vi -- ņa vār -- du. Jē -- zus ir šeit.
}
lyricB = \lyricmode {
\set stanza = "2. "
Kungs ir ar mums. Kungs ir ar mums.
Mēs ce -- ļam ro -- kas, tei -- cam Vi -- ņa vār -- du. Kungs ir ar mums.
}
lyricC = \lyricmode {
\set stanza = "3. "
Dievs svē -- tī mūs. Dievs svē -- tī mūs.
Mēs ce -- ļam ro -- kas, tei -- cam Vi -- ņa vār -- du. Dievs svē -- tī mūs.
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



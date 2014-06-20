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
e1:min a:min b:7 e:min e:min d b:min e:min g a:min d:7 g e:min d b:min e:min
}

voiceA = \relative c'{
\clef "treble"
\key e \minor
\time 4/4

e4 e8 d e4 g | a1 | a4 a8 g a4 b | g1 | g4 g8 fis g4 g | fis8 g fis e d4 d | fis4 fis8 e fis4 g | e1 |
b'4 b8 a b4 d | c1 | c4 c8 b c4 d | b1 | g4 g8 fis  g4 a | fis8 g fis e d4 d | fis4 fis8 e fis4 g | e1 \bar"|."
}

lyricA = \lyricmode {
Ir ti -- kai vie -- nīgs Dievs, šeit Vi -- ņa svēt -- nī -- ca. Mēs ce -- ļos krī -- tam, vi -- si, kas šeit nā -- kam un Vi -- ņu sla -- vē -- jam.
Vie -- tā šai svē -- ta -- jā Dievs mū -- su bal -- si dzird. Mēs, Kun -- ga kal -- pi, Vi -- ņu svē -- tā na -- mā tei -- cam un pie -- lū -- dzam.
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
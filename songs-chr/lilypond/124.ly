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
s8 a1:min c g a:min a:min c g a:min
c a:min c g c a:min g a:min
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\partial 8

e8 | a a4 e8 a4 a8 e | g g4 e8 g2 | b4 b b8 c b a~ | a2 a4 r8 e |
a a4 e8 a4. e8 | g8 g4 e8 g2 | b4 b b8 c b a~ | a2. r4 \bar"||" \break
g4 g8 g4. g4 | a e8 e4. d4 | c c d8 e4. | d1 |
g4 g8 g4. g4 | a e8 e4. e4 | b'b a b | a1 \bar"|."
}

lyricA = \lyricmode {
Gars, ko Es jums sū -- tī -- šu, ie -- mā -- cīs jums vi -- sas lie -- tas no jau -- na.
Jums ir Ma -- ni vār -- di, iz -- pil -- diet tos, tie jums dzī -- vī -- bu dos.
\set stanza = "1. "
Mū -- su sir -- dīs uz -- aust gais -- ma__- Jē -- zus, Die -- va Dēls.
Ie -- lē -- jis tur Svē -- to Ga -- ru, kas mūs at -- jau -- no.
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



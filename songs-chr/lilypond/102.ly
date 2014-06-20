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
g1 a:min c g g a:min c g
s4 d1 g d g d g2. e4:min c2 d g1
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 4/4

g8 g g g g g a b | a4 e2. | c'1 | b8 ([a]) g2. |
g8 g g g g g a b | a4 e2. | c'1 | b8 ([a]) g2 s4 \bar"||" \break
\partial 4
fis8^\markup {\translate #'(-8 . 0) \italic Refrēns} g | a4 a8 a a4 g8 a | b c b a g4 fis8 g | a2 a8 b g a |
b2. fis8 g | a4 a8 a a4 g8 a | b c b a g4 a8 b | c2 b8 a g fis | g1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tu mums rā -- di pa -- tie -- sī -- bas ce -- ļu. Tu, Jē -- zu.
Tu, kas gri -- bi, lai Tev lī -- dzi e -- jam, Tu, Jē -- zu.
Ti -- kai Tu zi -- ni to, ko sirds ma -- na pār -- dzī -- vo. Ti -- kai Tu, Jē -- zu, ti -- kai Tu.
Ti -- kai Tu zi -- ni to, ko sirds ma -- na pār -- dzī -- vo, ti -- kai Tu zi -- ni, ti -- kai Tu.
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



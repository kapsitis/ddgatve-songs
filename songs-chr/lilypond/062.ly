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
s1 d g g e:min e:min c c d d
g g e:min e:min c c d d g g e:min e:min c c d d 
}

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 4/4

r1^\markup {\translate #'(-5 . 0) \italic Solo: } | r2 r4 b8 a | g g4 fis8 g fis g fis | g g~ g2 b8 a |
g8 g4 fis8 g fis g fis | g g~ g2 b8 a | g g4 fis8 g fis g fis |
g g~ g2 b8 a | a8 a4 a8 a4 a | b8 ([a]) b a b a b ([a]) \bar"|."
\repeat volta 2 {
g8^\markup {\translate #'(-5 . 0) \italic Visi: }  g4 g8 g2 | g8 g4 g8 g \(fis g fis \) | e8 e4 e8 e2 | e8 e4 e8 e \(d e d \) |
c8 c4 c8 c2 | c8 c4 c8 c \(b c cis \) | d8 d4 d8 d2 | d8 d4 d8 e \(d e fis \) |
g8 g4 g8 g2 | g8 g4 g8 g \(fis g fis \) | e8 e4 e8 e2 | e8 e4 e8 e \(d e d \) |
c8 c4 c8 c2 | c8 c4 c8 c \(b c cis \) | d8 d4 d8 d2 | d8 d4 d8 e \(d e fis \) }
}

lyricA = \lyricmode {
\set stanza = "1. "
Te -- vi teic vi -- sa pa -- sau -- le un sla -- vē, teic par sau -- li un mē -- ne -- si, un zvaig -- znēm,
teic par jū -- ru un vi -- siem kon -- ti -- nen -- tiem, teic un sla -- vē,
jo Tu, Kungs, e -- si tik brī -- niš -- ķīgs!
Lau -- da -- to si, o mio Sig -- no - - re, lau -- da -- to si, o mio Sig -- no - - re,
lau -- da -- to si, o mio Sig -- no - - re, lau -- da -- to si, o mio Sig -- no - - re,
lau -- da -- to si, o mio Sig -- no - - re, lau -- da -- to si, o mio Sig -- no - - re,
lau -- da -- to si, o mio Sig -- no - - re, lau -- da -- to si, o mio Sig -- no - - re!
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



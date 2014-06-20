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
c1:7 f2:sus4 f1. c1. c2 bes1 g:7 c1 c:7 f2:sus4 f1. c1. c2 bes1 g2:min c f1
}

voiceA = \relative c'{
\clef "treble"
\key f \major
\time 4/4

r2 c4 c' | bes4. (a8) a2~ | a4 r4 a a | a4. g8 g2~ | g4 r g a | g4. f8 f4 g | a a g f | g1~ |
g4 r c, c' | bes4. (a8) a2~ | a4 r a a | a4. g8 g2~ | g4 r g a | g4. f8 f4 g | a g f e | f1 \bar"|."
}

lyricA = \lyricmode {
Va -- rens e -- si, de -- bess Ka -- ra -- li! Pie -- ņem ma -- nu pa -- ze -- mī -- go u -- pu -- ri! Mī -- lu Te -- vi, vien -- mēr sla -- vē -- ju, sa -- vu dzī -- vi vē -- los Tev pie kā -- jām likt!
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
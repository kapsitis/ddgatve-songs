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
a1:7 d e:7 a fis:min b:min e:7 a a:7 d e:7 a fis:min b:min e:7 a1. a2:7 d1. d2 a1. a2:7 d1 e:7 a1. a2:7 d1. d2 a1. a2:7 d1 e:7 a1. s2
}

voiceA = \relative c'{
\clef "treble"
\key a \major
\time 4/4

r4 cis d e | fis2. a4 | gis a gis4. fis8 | fis4. (e8) e2 | r4 cis d cis| b1~ | b2 fis'4. e8 | e1~ |
e4 cis d e | fis2. a4 | gis4 a gis4. fis8 | fis4. (e8) e2~ | e4 r d cis | b1~ | b2 fis'4 a | a1~ |
a4 r cis b | a1~ | a4 r cis b | a1~ | a4 r cis b | a2~ (a8 [fis] a4 | b2) fis4 a | a1~ | a4 r cis b | a1~ | a4 r cis b | a1~ | a4 r cis b | a2~ (a8 [fis] a4 | b2) fis4 a | a1~ | a2 r \bar"|." 
}

lyricA = \lyricmode {
Cik labs ir Tas, kurš nes mums jau -- nu vēs -- ti, lai glāb -- tu šo pa -- sau -- li. Viņš vēs -- tī mie -- ru, mī -- les -- tī -- bu, prie -- ku. Dievs ir Kungs, Ka -- ra -- lis! Dievs ir Kungs, Ka -- ra -- lis. Dievs ir Kungs, Ka -- ra -- lis. Dievs ir Kungs, Ka -- ra -- lis, Dievs ir Kungs, Ka -- ra -- lis!
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
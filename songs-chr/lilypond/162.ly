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
s8 d2. g4. d e:min a:7
d1. g4. d e:min a:7
d2. d1. g4. d
e:min b:min a2. g4. d e:min a:7
d a:7 d g d a g a:7 d2.
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 6/8
\partial 8

fis8 | a a a fis g a | b4. a4 a8 | g g g a a g | 
fis4.~ fis4 fis8 | a a a fis g a | b4. a4 a8 | g g g a a g | 
fis4.~ fis4 a8 | d4. cis4 b8 | a4. fis4 fis8 | b4. a4 a8 | 
g4. fis4 fis8 | e4. fis4 g8 | b4. a4 a8 | g4. a4 g8 | 
fis4.~ fis4 a8 | a4. b4 cis8 | d4. a4 a8 | b4. cis4 cis8 | d4.~d4 s8 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tu li -- li -- ja brī -- niš -- ķi skais -- tā, kas de -- be -- su pa -- gal -- mos zied,
tā mī -- lēt mūs mā -- ci, lai spē -- tu caur grū -- tī -- bām prie -- cī -- gi iet.
Lai Die -- vam, cik va -- ram, mēs go -- du vien da -- rām,
ak, Te -- rē -- ze svē -- tā, lūdz Die -- vu par mums!
Ak, Te -- rē -- ze svē -- tā, lūdz Die -- vu par mums!
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



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
d1. b:min e:min a d1 s8 a4.:7 d2. d:7
s4. g1. d e2.:min a:7 d d:7 g1. d e2.:min a:7 d1.
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 6/8

fis2.~ | fis8 e fis g fis e | d4. d~ | d e4 fis8 | g4. g~ | g4 g8 g g fis |
e4. e~ | e a,8 d e | fis4. fis~ | fis4 fis8 g4 e8 | d4. d~ | d s4. \bar"||" \break
\partial 4.
d4.^\markup {\translate #'( -8 . 0 ) \italic Refrēns} | b' b~ | b8 b cis d cis b | a4. a~ |
a g4 fis8 | g4. g~ | g8 g a b a g | fis4. fis~ | fis d4 d8 | b'4. b~ | b8 b cis d cis b | a4. a~ |
a g4 fis8 | g4. g~ | g8 e fis g fis e | d2.~ | d \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kungs kād -- reiz pie -- stā -- ja kra -- tā mek -- lēt ļau -- dis, las ga -- ta -- vi bū -- tu
iet Vi -- ņam lī -- dzi uz sir -- žu zve -- ju.
Jā, gan, Kungs, pa -- ska -- tī -- jies uz ma -- ni,
lū -- pas Ta -- vas vār -- du iz -- tei -- ca ma -- nu,
sa -- vu strū -- gu šo -- dien pa -- me -- tu kras -- tā,
jau -- nā zve -- jā pa -- ņem ma -- ni sev līdz.
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



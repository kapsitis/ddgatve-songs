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
g1. e:min a:min d2. d:7 g1. e:min a:min d
a:min d g e:min a:min d2.:sus4 d:7 g1. s1.
c g c g2. g:7 c1. d:7 g1. s
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 6/4

d2.~ d4 e fis | g2. g2 e4 | c2.~ c4 d e | d2. d |
d2.~ d4 b d | g2. g2 fis4 | e2.~ e4 d e | d2. d \bar"||"
a'2.~^\markup { \translate #'( -8 . -4 ) \italic Refrēns} a4 g b | a1. | g2.~ g4 e a | g2. g2 (fis4) | e2.~ e4 c e | g2.~ g4 g fis | g1.~ | g |
e2.~ e4 fis g | b1. | e,2.~ e4 fis g | b2.~ b4 g g | c2.~ c4 b a | a2. a2 g4 | g1.~ |g \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. " 
Pa -- liec ar mums, Kungs, ak, pa -- liec, vēl pa -- liec,
ne -- at -- stāj mūs, sa -- vu mie -- ru mums dā -- vā.
Ne -- at -- stāj mūs, ne -- pa -- liec tā -- lu: nakts tad vairs ne -- būs ne -- kad.
Ne -- at -- stāj mūs, ne -- pa -- liec tā -- lu, no pa -- sau -- les mal -- diem mūs glāb.
}
lyricB = \lyricmode {
\set stanza = "2. "
Ko -- pā ar Te -- vi mēs ie -- sim pie ci -- tiem,
ko -- pā ar Te -- vi mēs iz -- ie -- sim dzī -- vē.
}
lyricC = \lyricmode {
\set stanza = "3. "
Pie -- ņem no ma -- nis, Kungs, šīs ma -- nas ro -- kas,
pie -- ņem no ma -- nis šo sir -- di, kas mī -- lē.
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



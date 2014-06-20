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
s4 f2 g a1:min f2 g a1:min f2 g a1:min f2 g a2.:min s4
s4 c2 d:min g1 c2 d:min g1
f e2:min f4 c f2 d:min g1. s2
}

voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 4/4
\partial 4

a8^\markup { \translate #'(-9 . 0) \italic Refrēns} b \bar"||" c4 c8 c b a g a~ | a2. a8 b | c4 c b8 a g a~ |
a2. a8 b | c4 c8 c b a g a~ | a2. a8 b | c4 c8 c  b a g a~ | a2. s4 \bar"||" \break
\partial 4
c,8 d| e4 e f8 e d g~ | g2. c,8 d | e4 e f8 e d g~ | g1 | \break
r4 a8 a a b c4 | g g8 g f4 e | f f f f | g1 | g4 r r a8 b \bar"||"
}

lyricA = \lyricmode {
Šo -- dien uz -- au -- sa gais -- ma un prieks. Gais -- mu šo ir ie -- de -- dzis Dievs.
Vi -- sām ro -- be -- žām pā -- ri tā ies. Vi -- sas sir -- dis tai māj -- vie -- tu sniegs.
\set stanza = "1. "
Ga -- vi -- lē nu ste -- pes un zied, prie -- kā vi -- sa ra -- dī -- ba dzied:
jo no ze -- mes ir iz -- ver -- dis Ū -- dens, Ū -- dens, kas ir Kungs. _ Šo -- dien
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "2. "
Kun -- ga go -- du re -- dzēs ik -- viens. Mū -- su Die -- va spēks ir tik liels!
Sa -- kiet vi -- siem, kas drū -- mi un skumst, lai dzied un ne -- bai -- dās.
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
\set stanza = "3. "
Kungs ir nā -- cis vi -- sus mūs glābt. Sa -- vās sir -- dīs at -- ļau -- sim nākt
Die -- va lie -- la -- jai mī -- les -- tī -- bai, kas grib mūs at -- pes -- tīt!
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



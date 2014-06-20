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

%chordsA = \chordmode {}

voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
\dynamicUp

g4\mf e8 c | d [(e]) d4 | c2 | g'4 a8 c | b g a g | f e d e | g2|
g4 e8 c | d [(e]) d4 | c2 | g'4 a | g8 e f [(g]) | g2 |
g4 a8 c | b [(g]) a4 | g2 | a4 g | f8 e d4 | c2 |
 e4 f8 e | d4 e8 f | g4 e | d2 | e4 (f8 [g]) | a4 g8 g | f [(e]) d4 | e2 |
a\f | e | f8 g a4 | g2 | c\f | g4 g | a8 g f4 | g2 | e'4\f (d8 [e]) | c2 | a4\mf (g8 [a]) | f2 |
e\f | f8 [(e]) d4 | e8 d c4 | d d | c2 |
f8\p [(e]) d [(c]) | f4 g8 a | c2 | a | bes8 a g f | g4 (a) | g2 | r2 |
f8\p [(e]) d [(c]) | f4 g8 a | c2 | a | bes8 a g [(f]) | g4 a8 [(f]) | g4 g | g2 |
f4 (g) | c a8 f | bes a g f | g4 c, | bes'8 a g f  | g4 (a) | f2 | r |
d'\f | c4 f, | bes a8 f | g2 | d'\f | c4 f, | bes a8 f | g2 |
d'\f | c8 a g f | g4 a8 f | g4 c, | d8 [(e]) f g | a4 e | f8 g a bes | c a f4 | d'2\mf (| c) | f, | r \bar"|."
}

lyricA = \lyricmode {
Gods Die -- vam aug -- stu -- mos, un miers virs ze -- mes la -- bas gri -- bas cil -- vē -- kiem.
Mēs Te -- vi sla -- vē -- jam, tei -- cam un pie -- lū -- dzam,
mēs Te -- vi cil -- di -- nām un Tev pa -- tei -- ca -- mies,
jo lie -- la ir Ta -- va go -- dī -- ba, Kungs, de -- be -- su Ka -- ra -- li, Dievs, vis -- va -- re -- nais Tēvs.
Dievs, vien -- pie -- dzi -- mu -- šais Dēls, Jē -- zu Kris -- tu, Tu Kungs Dievs, Die -- va Jērs, Tē -- va Dēls,
Tu nes pa -- sau -- les grē -- kus, ap -- žē -- lo -- jies par mums.
Tu nes pa -- sau -- les grē -- kus, uz -- klau -- si mū -- su lūg -- ša -- nu.
Tu sē -- di pie Tē -- va la -- bās ro -- kas, ap -- žē -- lo -- jies par mums.
Vie -- nī -- gi Tu e -- si svēts, vie -- nī -- gi Tu e -- si Kungs.
Tu vis -- aug -- stā -- kais, Kungs Jē -- zu Kris -- tu ar Svē -- to Ga -- ru: Die -- va Tē -- va go -- dī -- bā. A -- men.
}

fullScore = <<
%\new ChordNames { \chordsA }
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



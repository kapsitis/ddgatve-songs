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

voiceA = \relative c''{
\clef "treble"
\key d \major
\time 4/4
\dynamicUp
a2\mf^\markup { \translate #'(-11 . 2) \italic Enerģiski }  fis4 d | d'4. d8 cis4 cis4 | b2 (a4) g | a2 a | g4 g a b | a a a2 |
a fis4 d | d'4. d8 cis2 | b a4 g | a a a2 | g a4 b | a a a2 | g4 g a b | a a2 a4 | a2 fis4 d | d'2 cis | b a4 g | a1 |
g2 a4 b | a fis fis2 | g4 g g a8 b | \time 3/4 a2. \bar"||" b\mf | a2 fis4 | d d e | fis2. | g4 (a) b | a2 a4 | 
b2. | a2 fis4 | d2 e4 | fis2. | g4 (a) b | a2. | b2 b4 | a a fis | d2 (e4) | fis2. | g4 (a) b | a2 a4 | g (a) b | a2. |
b2 b4 | a a fis | d2 (e4) | fis2. | g4 a b | a2 a4 | g (a) b | a2 a4 | b b b | a2 fis4 | d2 e4 | fis2 fis4 | g (a) b | a2 a4 | g (a) b | \time 4/4 a1 \bar"||" 
a2\f fis4 d | d' d8 d cis2 | b2 a4 g | a a8 a a2 | a (fis4) d | d'4. d8 cis2 | b a4 g | a2 a | g a4 b | a2 fis | g4 g a b | cis4. cis8 cis2 | d1\mf | d \bar "|."
}

lyricA = \lyricmode {
Gods Die -- vam aug -- stu -- mos un miers virs ze -- mes la -- bas gri -- bas cil -- vē -- kiem. Mēs Te -- vi sla -- vē -- jam, tei -- cam un pie -- lū -- dzam, mēs Te -- vi cil -- di -- nām un Tev pa -- tei -- ca -- mies, jo lie -- la ir Ta -- va go -- dī -- ba, Kungs, de -- be -- su Ka -- ra -- li, Dievs, vis -- va -- re -- nais Tēvs.
Dievs, Vien -- pie -- dzi -- mu -- šais Dēls, Jē -- zu Kris -- tu, Tu Kungs Dievs, Die -- va Jērs, Tē -- va Dēls, Tu nes pa -- sau -- les grē -- kus, ap -- žē -- lo -- jies par _ mums.
Tu nes pa -- sau -- les grē -- kus, uz -- klau -- si mū -- su lūg -- ša -- nu. Tu sē -- di pie Tē -- va la -- bās ro -- kas, ap -- žē -- lo -- jies par mums. _
Vie -- nī -- gi Tu e -- si svēts, vie -- nī -- gi Tu e -- si Kungs. Tu vis -- aug -- stā -- kais, Kungs Jē -- zu Kris -- tu ar Svē -- to Ga -- ru Die -- va Tē -- va go -- dī -- bā. A -- men.
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
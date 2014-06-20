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
e2.:min a:min d g c a4.:min7 a:min6 b2.:7 e:min e:min a:min d:7 g g c d:7 g4. b:7 e2:min s8 b8:7 e2.
}

voiceA = \relative c'' {
\clef "treble"
\key e \minor
\time 6/8

g8 fis e e fis g | b4. a | a8 fis e d e fis | a4. g | g8 fis e e dis e | g4. fis | b8 a g g g fis | e4.~ e|
b'8 a g g a b | c4. c | c8 a g fis g a | b4. b |
 d8 c b b c d | d4. c | e8 c b a b c | b2. | b8 a g g g fis | e2.\bar "|."
}

lyricA = \lyricmode {
Pie -- dod mums, Diev -- mā -- te, pie -- dod! Dzies -- mas vis -- skais -- tā -- kās dzie -- dot, at -- ne -- sam sir -- dis Tev zie -- dot, ce -- ļos pie al -- tā -- ra stāt. 
Pa -- cel Tu vē -- lī -- gās ro -- kas, svē -- tī -- jot lau -- kus un ko -- kus, Dzim -- te -- nes ap -- vār -- šņu lo -- kus, brī -- niš -- ķā A -- glo -- nas Māt, brī -- niš -- ķā A -- glo -- nas Māt!
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



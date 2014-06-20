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
s4 e2:min b4 e2:min d g4 e:min a:min d g2 a4:min b e2:min a4:min e:min e2:min a4:min e:min s4 e:min a:min d g2 a4:min b e4:min
}

voiceA = \relative c'{
\clef "treble"
\key e \minor
\time 4/4

\repeat volta 2 {r4 b e fis | g fis8 g a g a a | b4 b8 b c c d a | b b4 g8 a g fis fis | e4
r8 b' c4 b | b8 b b b c4 b | r4 b8 b c c d a | b b4 g8 a g fis fis | e4 s2.}

}

lyricA = \lyricmode {
Tavs Krusts, Kungs, dod jau -- nu dzī -- vi un mūs glābj, Ta -- va aug -- šām -- cel -- ša -- nās, Kungs, mums dā -- vā ce -- rī -- bu,
caur nā -- vi Tu mūs at -- pes -- tī -- ji, Ta -- va aug -- šām -- cel -- ša -- nās, Kungs, mums dā -- vā ce -- rī -- bu.
}
lyricB = \lyricmode {
Cru -- cem tu -- am a -- do -- ra -- mus Do -- mi -- ne, re -- sur -- rec -- ti -- o -- nem tu -- am lau -- da -- mus Do -- mi -- ne,
lau -- da -- mus et glo -- ri -- fi -- ca -- mus re -- sur -- rec -- ti -- o -- nem tu -- am lau -- da -- mus Do -- mi -- ne.
}


fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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
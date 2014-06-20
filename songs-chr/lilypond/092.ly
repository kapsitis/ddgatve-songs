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
f1 c:6 d:min bes f2 bes g:min c:6 f2. s8 c f1 f c:6 d:min bes f2 bes g:min bes c1 f
}

voiceA = \relative c''{
\clef "treble"
\key f \major
\time 4/4

a8 a a4 g a | c8 c c4 d c | d8 (e f e d4.) c8 | d1 |
r8 c4 c8 d [(c]) bes a | r bes4 bes8 c [(bes]) a g | c2~ c4 \times 2/3 {bes8 [a g]} | f1 |
a8 a a g a2 | c8 c c d c2 | d8 (e f e d4. c8) | d1 |
r8 c4 c8 d8 [(c]) bes a | r d4 d8 d [(f]) e d | c2~ c4 \times 2/3 {bes8 [a g]} | f1 \bar"|."
}
lyricA = \lyricmode {
Be -- ne -- di -- ca -- mus, be -- ne -- di -- ca -- mus, Do -- mi -- no, 
be -- ne -- di -- ca -- mus, be -- ne -- di -- ca -- mus, Do -- mi -- no.
De -- o gra -- ti -- as, De -- o gra -- ti -- as, De -- o, 
De -- o gra -- ti -- as, De -- o gra -- ti -- as, Do -- mi -- no.
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
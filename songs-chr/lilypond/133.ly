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
e1:min b1... s8 e1:min g d2 a:min c a:min e1:min
}

voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 4/4
%\dynamicUp

e8 fis g fis e4 e | fis2 fis | fis8 g a g fis4 g8 [(fis]) | e2 e |
b'8 b b c d4 e8 [(b]) | a4. (b8) c 2 | g8 g c b a4 a | e2 d \bar"|."
}

lyricA = \lyricmode {
Ma -- na dvē -- se -- le ir klu -- sa, sa -- vā svēt -- ce -- rē uz Die -- vu. 
Ma -- na dvē -- se -- le ir klu -- sa, sa -- vā svēt -- ce -- rē uz Die -- vu.
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



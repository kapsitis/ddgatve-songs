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

voiceA = \relative c'' {
\clef "treble"
\key e \minor
\time 3/4
\dynamicUp
g2.\p | a8 b g4. a8 | a (b) b2~ | b \oneVoice r4 | g2.\mp| a8 b g4. a8 | \stemDown a( \stemNeutral b) b2~ | b r4 \voiceOne |
d2\mf d4 | d8 e c4. b8 | b2. | a | e'2\f c4 | d8 c b4. a8 | a (b) e,2 |
\oneVoice g2.\p | a8 b g4. a8 | \stemDown a ( \stemNeutral b) b2~ | b r4 \voiceOne | c2.\mp | b8 a g4. a8 | a\p (b) e,2~ | e2.\bar "|."
}

lyricA = \lyricmode {
Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums.
Kris -- tu, ap -- žē -- lo -- jies par mums. Kris -- tu, ap -- žē -- lo -- jies par mums.
Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums.
}

voiceB = \relative c'' {
\clef "treble"
\key e \minor
\time 3/4  
s2. | s2. | a8 (b)  e,2~ | e s4 | s2.| s2. | s2. | s2. |
b'2 b4 | b8 c a4. g8 | g2. | fis | c'2 a4 | b8 a g4. fis8 | fis (g) e2 |
s2. | s2. | s2. | s2. | a2. | g8 fis e4. fis8 | fis (g) e2~ | e2.\bar "|."
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }

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
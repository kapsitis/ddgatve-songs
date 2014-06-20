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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\dynamicUp

e2\p d8 e g e | d4 (c) e2 | e2\mp d8 e g e | f4 (g) e2 | a2\f g8 a f e | f4 (g) e2 | f8\p e d c d4 (c) | c2 r |
a'4\mf (c) g2 | a8 g f e f [(g]) e4 | a\mf (c) g2 | a8 g f e f [(g]) e4 | a\f g f e | f8 e d c d [(c]) c4 |
e2\p d8 e g e | d4 (c) e2 | e\mp d8 e g e | f4 (g) e2 | a\f g8 a f e | f4 (g) e2 | f8\p e d c d4 (c) | c2 r \bar"|."
}

lyricA = \lyricmode {
Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums.  Ap -- žē -- lo -- jies par mums.
Kris -- tu, ap -- žē -- lo -- jies par mums. Kris -- tu, ap -- žē -- lo -- jies par mums. Kris -- tu, Kris -- tu, ap -- žē -- lo -- jies par mums.
Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums. Kungs, ap -- žē -- lo -- jies par mums.  Ap -- žē -- lo -- jies par mums.
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



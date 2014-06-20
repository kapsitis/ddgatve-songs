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
g4\p (a) b | a2. | b8 b a4 g8 b | a4 (g) a | b\f b a8 g | fis4 e2|
g4\mp (a) b | a2. | b8 b a4 g8 b | a4 (g) a | b\f b a8 g | fis4 e2|
g4\f (a) b | a2. | b8 b a4 g8 b | a4 (g) a | b\p a g | fis e2| \bar "|."
}

lyricA = \lyricmode {
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, ap -- žē -- lo -- jies par mums. 
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, ap -- žē -- lo -- jies par mums.
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, dā -- vā mums mie -- ru.
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
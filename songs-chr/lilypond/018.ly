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
\key g \major
\time 4/4
\dynamicUp
b4\mf g a2~ | a4 a a2 | a g4 a | b2 e, | g4 e e d | fis2 e \bar"||" g e | a4 (g) g2 \bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1.-3. "
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, \set stanza = #"1.-2. "ap -- žē -- lo -- jies par mums. \set stanza = #"3. " Dod mums mie -- ru.
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
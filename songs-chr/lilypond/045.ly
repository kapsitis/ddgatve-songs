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
g2. c:6 d g4:sus4 g2 g2.c:6 d:7 g4:sus4 g2 g2. c d c4 g2 g2. c:6 d d4:7 g2 g2. c d c4 g2 g2. c:6 d:7 d4:7 g2
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/4
\dynamicUp

d4 g\mf b | b a8 [(g]) a4 | fis a c | c b2 | d,4 g b | b a8 [(g]) a4 | fis e d | a' g2 |
g4 b d | d c8 [(b]) c4 | a c c | c b2 | d,4 g b | b a8 [(g]) a4 | fis8 [(g]) a4 a | a g2 | 
g4 b d | d c8 [(b]) c4 | a c e | e d2 | d,4 g b | b a8 [(g]) a4 | fis8 [(g]) a4 a | a g2 \bar "|."
}

lyricA = \lyricmode {
Ag -- lo -- na, Ag -- lo -- na, Lat -- ga -- les il -- gas, brī -- nu -- mu Jau -- na -- va Svēt -- ce -- ļi -- nie -- kiem.
Mār -- ze -- mes e -- ze -- rus tu -- ri Tu klē -- pī, pa -- kal -- nus, tī -- ru -- mus sar -- gā un svē -- tī.
Mār -- ze -- mes e -- ze -- rus tu -- ri Tu klē -- pī, pa -- kal -- nus, tī -- ru -- mus sar -- gā un svē -- tī.
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



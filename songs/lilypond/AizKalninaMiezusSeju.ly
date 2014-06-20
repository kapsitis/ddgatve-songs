\version "2.13.16"
%\header {
%    title = "Aiz kalniņa dūmi kūp"
%}
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
\key c \major
\time 3/8
g4 e8 | a4 g8 | g4 f8 | f4 d8 | 
f4 d8 | g4 f8 | f4 e8 | e4. |
c'4 b8 | d4 c8 | b4 a8 | g4 c8 |
e,4 d8 | a'4 g8 | g8.[ f16] d16[ e16] | c4. \bar "|."
} 

lyricA = \lyricmode {
Aiz kal -- ni -- ņa mie -- žus sē -- ju, 
Lai a -- pi -- nis ne -- re -- dzēj'.
A -- pi -- nī -- tis gud -- ris vī -- ris
Kal -- nā kā -- pa lū -- ko -- ties.
} 

fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



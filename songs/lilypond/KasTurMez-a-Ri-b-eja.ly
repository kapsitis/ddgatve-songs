\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tur mežā rībēja",AA lapas, bērnu
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 e d e |
f8 f f[ e] |
d8 d d f |
e8 e e[ d] |
c8 c c c16[ e] |
d8 d d8.[ c16] |
b8 g e'8. d16 |
c8 c c4 |
\bar "|."
} 

lyricA = \lyricmode {
 Kas tur me -- žā rī -- bē -- ja, zem o -- zo -- la dū -- cē -- ja,
 ai -- jā, ai -- jā ai -- jai -- jā, zem o -- zo -- la dū -- cē -- ja?
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



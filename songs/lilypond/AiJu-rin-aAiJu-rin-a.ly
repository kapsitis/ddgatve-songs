\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, jūriņa, ai jūriņa"
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
\time 3/4
d4 e g8 e |
\time 2/4
e8 d d d |
d8 e d d |
e8 d d4 |
e8 e e e |
e8 d e d |
d8 d c b |
d8 c c4 |
\bar "|."
} 


lyricA = \lyricmode {
Ai, jū -- ri -- ņa, ai, jū -- ri -- ņa, pa -- nes ko -- ka ga -- ba -- liņ',
ai, jū -- ri -- ņa, ai, jū -- ri -- ņa, pa -- nes ko -- ka ga -- ba -- liņ'
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




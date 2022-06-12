\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Šūpojiesi, šūpulīti, lai aug lieli bālēliņ'",AA lapas
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
\repeat volta 2 {
\time 2/4
f8 d e e |
d8 c c d16[ e] |
f8 d e e |
d8 c c4 |
}
} 

lyricA = \lyricmode {
Šū -- po -- jie -- si, šū -- pu -- lī -- ti, lai aug lie -- li bā -- lē -- liņ',
šū -- po -- jie -- si, šū -- pu -- lī -- ti, lai aug lie -- li bā -- lē -- liņ'.
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



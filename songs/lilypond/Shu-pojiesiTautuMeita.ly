\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.134
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time3/4
e4 c d8 e |
f4. d8 f e |
d4 g d8 e |
f4. a8 g f |
e4 c d8 e |
f4. d8 f e |
d4 g d8 e |
f8 d c2 |
\bar "|."
}

lyricA = \lyricmode {
Šū -- po -- jie -- si tau -- tu mei -- ta Liel -- die -- nī -- šu šū -- po -- lē -- si, šū -- po -- jie -- si tau -- tu mei -- ta Liel -- die -- nī -- šu šū -- po -- lēs!
}


fullScore = <<

%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



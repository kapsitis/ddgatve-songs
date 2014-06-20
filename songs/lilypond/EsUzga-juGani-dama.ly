\version "2.13.16"
%\header {
%    title = " Es uzgāju ganīdama ",Laivas lapas
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
\key d \minor
\time 2/4
d8 a' f a |
g8 f16[ e] d8 a |
d8 a' f a |
g8 f16[ e] d8 d |
g4 f |
bes8 bes a4 |
g8 f a a |
g8 f16[ e] d4 |
\bar "|."
}

lyricA = \lyricmode {
 Es uz -- gā -- ju ga -- nī -- da -- ma bir -- zē skais -- tu o -- zo -- li -- ņu, trā -- rā, trā -- rā -- rā,
 bir -- zē skais -- tu o -- zo -- liņ'.
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



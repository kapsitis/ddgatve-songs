\version "2.13.16"
%\header {
%    title = "Aijā, Ancīt, aijā"
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
\key a \minor
\time 2/4
a'8 b c b | c4 a | c8 d e d | e2 | 
e8 d c b | c4 a | d8 c b c | a2 |
\bar "|." 
} 

lyricA = \lyricmode {
Ai -- jā, An -- cīt, ai -- jā sal -- dā mie -- dzi -- ņā. 
Mā -- siņ' te -- vi šū -- pos vieg -- lām ro -- ci -- ņām. 
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



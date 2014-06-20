\version "2.13.16"
%\header {
%    title = "Aijā, žūžū, mazais bērniņ"
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
\repeat volta 2 {
g'8 e f d |
f8 e e c |
e8 d f b, |
d8 c c4 |
}
\repeat volta 2 {
g8 b d e |
f8 e e c |
e8 d d b |
}
\alternative { { d8 c c a | } {d8 c c c | } }

} 

lyricA = \lyricmode {
Ai -- jā, žū -- žū, ma -- zais bēr -- niņ, lai iet lie -- lie kā -- ji -- ņām!
Cū -- ciņ,' ga -- nīt, skai -- diņ' la -- sīt, ma -- ziem bēr -- niem put -- riņ' vā -- rīt; put -- riņ' vā -- rīt. 
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



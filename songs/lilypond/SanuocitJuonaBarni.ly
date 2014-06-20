\version "2.13.16"
%\header {
%    title = "Sanuocit, Juoņa bārni"
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

voiceA = \transpose d a { \relative c'' {
\clef "treble"
\key d \minor
\repeat volta 2 {
\time 2/4
g8 f e f | e8 d d e |
\time 3/4
f4 e4.( f8) | e4 d2 
}
} } 



lyricA = \lyricmode {
Sa -- nuo -- ci -- ti, Juo -- ņa bār -- ni, lei -- gū, lei -- gū, 
sa -- gai -- di -- ti Juo -- ņa dī -- nu, lei -- gū, lei -- gū.
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



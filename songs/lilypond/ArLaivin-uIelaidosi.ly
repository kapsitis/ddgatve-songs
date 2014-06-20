\version "2.13.16"
%\header {
%    title = "Ar laiviņu ielaidosi irbju šauti jūriņā"
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
\time 4/4
a4 d c a |
\time 6/4
d8[ c] d4 e2 a, |
\time 4/4
f'8[ e] d[ c] d4( c8) bes |
a4 g a2 |
\time 6/4
a'2 g4( a) f e |
d4 c8[ d] e2 a, |
\time 4/4
f'8[ e] d[ c] d4( c8) bes |
a4 g a2 |
\bar "|."
} 


lyricA = \lyricmode {
Ar lai -- vi -- ņu ie -- lai -- do -- si ir -- bju šau -- ti jū -- ri -- ņā;
ar lai -- vi -- ņu ie -- lai -- do -- si ir -- bju šau -- ti jū -- ri -- ņā.
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




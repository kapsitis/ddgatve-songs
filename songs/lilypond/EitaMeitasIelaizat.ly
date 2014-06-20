\version "2.13.16"
%\header {
%    title = "Eita, meitas, ielaižat"
%}
%#(set-global-staff-size 18)
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
\key a \minor
\time 4/2
c8 b c b c b c d e e e e d c16[ b] a8 a |
d4 c b16 a d8 a4 g8 g c8. c16 b16[ g] b8 a4
\bar "|."
} 

lyricA = \lyricmode {
Ei -- ta, mei -- tas, ie -- lai -- ža -- ti, 
Kas aiz dur -- vu dau -- zī -- jā -- si, 
E -- ju, ri -- di rai -- ra, 
Kas aiz dur -- vu dau -- zī jās.
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




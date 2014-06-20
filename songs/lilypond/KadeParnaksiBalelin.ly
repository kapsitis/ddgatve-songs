\version "2.13.16"
%\header {
%    title = "Kade pārnāksi, bāleliņ"
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
\key c \major
\time 13/4
g8 g c4 c d e8. c16 c4 c g c e a8[ g] g2 |
\time 15/4
a8[ g]  g2 f4 e e d c e f( e) d d8[ b] c4~ c8. a'16 |
\time 12/4
g2~ g8. a16 g2 e4 f4( e) d d8[ b] c2
\bar "|."
} 

lyricA = \lyricmode {
Ka -- de pār -- nāk -- si, bā -- ā -- le -- liņ, no ka -- ra lau -- ka?
Kad pār -- nāk -- si, bā -- le -- liņ, no ka -- ra lauk -- ka? 
Ta la, ta -- la, no ka -- ra lau -- ka?
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




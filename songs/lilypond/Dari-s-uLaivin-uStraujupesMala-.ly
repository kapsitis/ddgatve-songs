\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Darīšu laiviņu straujupes malā.",AA lapas, 
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
\time 3/8
f8 e g |
\phrasingSlurDashed
f16[ e] d8\( e\) |
f8 e g |
c,8 e4 |
d8 d c |
\phrasingSlurDashed
d8\( a\) a |
\time 2/4 
\phrasingSlurDashed
c8\( b\) a c |
\time 5/8 
d4 a4. |
\bar "|."
} 

lyricA = \lyricmode {
Da -- rī -- šu lai -- vi -- ņu strauj -- u -- pes ma -- lā,
da -- rī -- šu lai -- vi -- ņu strauj -- u -- pī -- tes  ma -- lā.
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



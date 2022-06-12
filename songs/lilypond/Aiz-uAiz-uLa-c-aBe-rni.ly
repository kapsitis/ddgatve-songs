\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aižu, aižu, lāča bērni"
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
\time 6/8
a'8 a4 c8 a4 | c8 d4 e8 d4 | d8 e4 d8 c4 | d8 c4 c4. 
\bar "|."
} 

lyricA = \lyricmode {
Ai -- žu, ai -- žu, lā -- ča bēr -- ni, pla -- ka -- nā -- mi kā -- ji -- ņām. 
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



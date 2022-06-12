\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lija lietus nenolija",AA lapas, Jāņi
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
\key d \major
\time 2/4
b8 b b b |
cis8 b cis b |
\time 3/4 
cis8[ b] d2 |
cis8[ b] cis2 |
\time 2/4
b8 e e d |
e8 d cis b |
\time 3/4 
cis8[ b] d2 |
cis8[ b] a2 |
\bar "|."
} 

lyricA = \lyricmode {
Li -- ja lie -- tus, ne -- no -- li - ja, lī -- go, lī - go,
rā -- ja tau -- tas, ne -- no -- rā -- ja, lī -- go, lī -- go
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



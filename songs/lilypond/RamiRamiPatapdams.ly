\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Rāmi, rāmi patapdams"
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
\key g \major
\time 2/4
g'8 g a a | b8 b g4 | a8 a fis fis | g8 g g4 | 
b8 b c c | d8 d b4 | c8 c d d | b8 b b4
} 

lyricA = \lyricmode {
Rā -- mi, rā -- mi, pa -- tap -- dams, nāk pār jū -- ru Pēr -- ko -- nīts,
Rā -- mi, rā -- mi, pa -- tap -- dams, nāk pār jū -- ru Pēr -- ko -- nīts,
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



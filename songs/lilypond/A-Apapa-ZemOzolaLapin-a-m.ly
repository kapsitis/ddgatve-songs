\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ā apapā, zem ozola lapiņām"
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
\time 4/4
\repeat volta 2 {
e4 f a8 g e4 | g8 g a g16[ f] g8 f e4 |
}
\repeat volta 2 {
e8 e f f a g e4 | 
g8 g a g16[ f] g8 f e4 |
e4 f a8 g e4 | g8 g a g16[ f] g8 f e4 |
}
} 

lyricA = \lyricmode {
Ā __ _ a -- pa -- pā, Zem o -- zo -- la la -- pi -- ņām, 
Gu -- li, gu -- li maz -- put -- niņ, 
Kas tev' rī -- tu pa -- šū -- pos. 
Ā __ _ a -- pa -- pā, Kas tev' rī -- tu pa -- šū -- pos. 
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



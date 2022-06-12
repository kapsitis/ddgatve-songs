\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Websense klade
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8 d d d | f4 d | f4 e8 e | d4 d | 
\repeat volta 2 {
\phrasingSlurDashed
d4 d8 d | f4 d8 d | f4 e8\( e\) | d4 d | 
} 
\override NoteHead.style = #'cross
d4 d4 |
\bar"|."
}

lyricA = \lyricmode {
Čet -- ri sta -- bi jū -- rā, zīl -- nie -- ce vi -- dū, 
At -- skrē -- ja gai -- ga -- la, sa -- si -- ta spār -- nus. 
}

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _
Sa -- sa -- la Dau -- ga -- va švirk -- stē- -- _ -- da -- ma.
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
\new Lyrics \lyricsto "voiceA"  \lyricB
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



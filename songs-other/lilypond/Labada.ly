\version "2.13.16" 
%\header {
% title = "Labada"
%}
% A.Rusecka, V.Gončārova, J.Vorošilova. "Sanākam svētkus svinēt", 
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\phrasingSlurDashed
g'4 g8 a g e e4 | f8 d d4 a'8 g g4 | g4 g8 a g e e\( e\) | g8 f e d c4 \oneVoice r4
\bar "|." 
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\phrasingSlurDashed
c4 c8 c e c c4 | d8 g, g4 e'8 c c4 | c4 c8 c e c c\( c\) | d8 g, g g c4 s4
\bar "|." 
}


lyricA = \lyricmode {
De -- jo -- sim de -- ju šo ra -- ta -- tā, ra -- ta -- tā, 
de -- ju  šo brī -- niš -- ķo, _ tā ir la -- ba -- da.
}

lyricB = \lyricmode {
\override LyricText #'font-shape = #'italic
Tań -- czy -- my la -- ba -- da la -- ba -- da, la -- ba -- da,
Tań -- czy -- my la -- ba -- da, ma -- łe -- go wal -- czy -- ka.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



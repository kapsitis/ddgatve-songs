\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Gāju, gāju, garu ceļu"; "Spēka dziesmas", p. 10
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
\key c \major
\time 4/4
g'8 e e8. e16 g8 e e8. e16 | g8 g a8. g16 g8 f f4 | 
f8 d d8. d16 f8 d d8. d16 | f8 f g8. f16 f8 e e4 |
g8 e e4 g8 e e4 | g8 g a8. g16 g8 f f4 | 
f8 d d4 f8 d d4 | f8 f g8 f16 f8 e e4
\bar "|." 
}

lyricA = \lyricmode {
Gā -- ju, gā -- ju ga -- ru ce -- ļu, ce -- ļam ga -- la ne -- zi -- nāj', 
Gā -- ju, gā -- ju ga -- ru ce -- ļu, ce -- ļam ga -- la ne -- zi -- nāj'. 
Ai -- jai -- jā, ral -- la -- lā, ce -- ļam ga -- la ne -- zi -- nāj', 
Ai -- jai -- jā, ral -- la -- lā, ce -- ļam ga -- la ne -- zi -- nāj'.
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



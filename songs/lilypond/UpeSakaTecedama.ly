\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Upe saka tecēdama"
%}
% Dace Prūse, personal communication
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
\key c \minor
\time 3/4
c4 c d8 ees | f4. ees8 d c | f8[ ees] f4 aes8 aes | g4 c, aes'8 g | 
f4 ees f8 g | ees8 c c2 | f4 ees f8 g | ees8 c c2 
\bar "|."
}


lyricA = \lyricmode {
U -- pe sa -- ka te -- cē -- da -- ma, u -- pe sa -- ka te -- cē -- da -- ma, 
es ba -- gā -- ta mā -- tes meit', es ba -- gā -- ta mā -- tes meit'. 
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, caunīte, vāverīte"
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
\time 2/4
c'8 c b b | e8 e d d | c8 c b e | a,8 a a4 | 
c8 c b4 | e8 e d4 | c8 c b e | a,8 a a4
\bar "|."
} 

lyricA = \lyricmode {
Ai, cau -- nī -- te, vā -- ve -- rī -- te,
Kas tev kā -- ra šū -- pu -- līt'. 
Ai -- ja -- jā, tra -- la -- lā, 
Kas tev kā -- ra šū -- pu -- līt'.  
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas briedimi, kas lācimi"
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
\time 2/4
e8 e a a | b8 e, c' c | d8 c b a16[ b] | c8 b a4 
\repeat volta 2 {
e8 e e'4 | f8 d e4 | d8 c b a16[ b] | c8 b a4
}
} 

lyricA = \lyricmode {
Kas brie -- di -- mi, kas lā -- ci -- mi me -- žā kā -- ra šū -- pu -- līt'. 
Ai -- ja -- jā, tra -- la -- lā, me -- žā kā -- ra šū -- pu -- līt'.
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



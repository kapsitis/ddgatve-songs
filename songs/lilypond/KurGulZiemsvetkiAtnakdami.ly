\version "2.13.16"
%\header {
%    title = "Kur guļ Ziemsvētki atnākdami"
%} 
% http://www.draugiem.lv/music/artist/?id=8767
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
\tempo 4=100
\clef "treble"
\key c \major
\time 6/8
\repeat volta 2 {
c4 d8 e d c | e8 g4 g8 e4 
}
\repeat volta 2 {
g8 g e g g e | f e d c4 c8 
} 
} 


lyricA = \lyricmode {
Kur guļ Ziem -- svēt -- ki at -- nāk -- da -- mi?
Zir -- dzi -- ņu stal -- lē -- i pie ku -- me -- ļie -- mi.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



\version "2.13.16"
%\header {
%    title = "Stāsti manim Daugaviņa"
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
\key d\major
\time 3/4
\repeat volta 2 {
fis8 e d4 d4 | fis8 e d4 d4 | 
e8 e e4 g | fis8 e fis2 
}
\repeat volta 2 {
g8 g b4 b | a8 fis a4 a | e8 fis g4 g 
}
\alternative { { fis8 e fis2 } { fis8 e d2 } }
} 



lyricAA = \lyricmode {
Stās -- ti ma -- nim, Dau -- ga -- vi -- ņa, Gau -- ja ne -- cie -- ti jel klus'.
Tra -- di ral -- lā, tra -- di ral -- lā, vai tā drīz jau lie -- la būs? lie -- la būs?
}

lyricAB = \lyricmode {
Kur aug ma -- na lī -- ga -- vi -- ņa, 
vai tā drīz jau lie -- la būs? _ _ _ _ _
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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




\version "2.13.16"
%\header {
%    title = "Nāc uz Nāves salu"
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
\key d \major
\time 3/8
a'4 a8 | fis4 d'8 | b4. | a4. | fis4 a8 | d4 e8 | cis4.~ | cis4. |
g4 g8 | e4 d'8 | cis4. | b4. | a4 a8 | e4 f8 | fis4. | r4 r8 |
a4 a8 | fis4 d'8 | b4. | a4. | fis'4 fis8 | e4 d8 | b4 r8 | r4 r8 |
\repeat volta 2 {
b4 b8 | g'4 g8 | a,4. | d8 r4 | cis4 a8 | e'4 fis8 | d8 r4 | r4 r8 
}
} 

lyricA = \lyricmode {
Nāc uz Nā -- ves sa -- lu, Tur tev' gai -- dī -- šu
Un pie ra -- ķeš -- gais -- mas Sal -- di skūp -- stī -- šu. 
Nāc uz Nā -- ves sa -- lu, Tur tev' gai -- dī -- šu 
Un pie ra -- ķeš -- gais -- mas Sal -- di skūp -- stī -- šu. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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



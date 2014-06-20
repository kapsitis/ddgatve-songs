\version "2.13.16"
%\header {
%    title = "Reiz mežā dzima eglīte"
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
\partial 4*1
g4 | e'4 e d e | c4 g g g | e'4 e f d | g2. g4 | a,4 a f' f | e4 d c g | e'4 e d e | c2. r4
\bar "|."
} 

lyricA = \lyricmode {
Reiz me -- žā dzi -- ma eg -- lī -- te un me -- žā au -- ga tā, 
tik slai -- da skais -- ta za -- ļok -- sna bij zie -- mā va -- sa -- rā. 
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



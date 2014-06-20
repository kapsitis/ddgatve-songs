\version "2.13.16"
%\header {
%    title = "Es vēlos mājās pārnākt"
%}
%#(set-global-staff-size 18)
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
\time 6/8
\tempo 4.=60
\partial 8*1
\phrasingSlurDashed
a8 | d4 d8 e( d) cis | d4. a4 a8 |  e'4 e16\( e16\) g4 fis8 | d4.~ d4 
\repeat volta 2 {
d8 | b'4 g8 g a b | a4. fis4 a,8 | a8( cis) e g( fis) e | d4.~ d4 
}
} 

lyricA = \lyricmode {
Es vē -- los mā -- jās pār -- nākt, kad ā -- be -- les zie -- dos plauks
Un vi -- ņu balt -- sār -- tiem zie -- diem būs pie -- sēts dārzs un lauks.
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




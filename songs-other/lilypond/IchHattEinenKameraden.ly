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
\key c \major
\time 4/4
\tempo 4=80
\partial 4*1
\phrasingSlurDashed
g4 | c4 e e d | c2 g4 c8 d | e4 g g f | e2. 
c8[ d] | e4 e e d | e4.( f8) g4 f8[ e] | d4 d d c4 | d4.( e8) f4 
g8[ f] |  e4 e d d8( e) | c2 d2 | e4 g d d8( e) | c2 r4 
\bar "|."
} 

lyricA = \lyricmode {
Ich hatt' 'nen Ka -- me -- ra -- den, Ei -- nen bes -- sern findst du nit. 
Die Trom -- mel schlug zum Strei -- te, Er ging an mei -- ner Sei -- te
In glei -- chem Schritt und Tritt, in glei -- chem Schritt und Tritt.
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




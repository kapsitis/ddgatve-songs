\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Iestādīju baltu pupu",AA lapas
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
\time 2/4
a8 d d d |
\time 3/4
d8 e fis4 d |
\time 2/4
e8 d cis r8 |
a'4 a |
a8 fis a fis |
a8 fis a cis, |
d8 d d4 |
\repeat volta 2 {
\time 2/4
d8. d16 d8 a |
a8 fis' fis fis |
fis8. fis16 fis8 cis |
d8 d d4 |
}
} 

lyricA = \lyricmode {
Ie -- stā -- dī -- ju bal -- tu pu -- pu, ķir vir bam! Ai nū nuš -- kad viš -- kad jau -- nuš lē -- per vis duš duš.
Pā -- ri dum -- bai dum -- bai kri -- kum, pā -- ri dum -- bai ņi -- ku ņek!
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



\version "2.13.18"


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

chordsA = \chordmode {
d2. g1. a:7 d2.:sus4 d b1.:min e:min a:7 g2. d d1.:7 g a:7 d2.:sus4 d b1.:min e:min a:7 d s2.
}

voiceA = \relative c'{
\clef "treble"
\key d \major
\time 3/4

fis4 g a | a2. | g~ | g2 e4 | e fis g | g2. | fis~ | fis2 d4 | d e fis | fis2. | e~ | e2 e4 | e fis g | g2. | fis~ | fis |
fis4 g a | a2. | g~ | g2 e4 | e fis g | g2. | fis~ | fis | d4 e fis | fis2. | e~ | e2 cis4 | cis d e | e2. | d~ | d \bar"|."
}

lyricA = \lyricmode {
At -- ver man a -- cis, lai re -- dzu es Jē -- zu un es -- mu es tu -- vāk, un ie -- mī -- lu Vi -- ņu.
At -- ver man au -- sis, lai va -- ru es dzir -- dēt. At -- ver man sir -- di, lai sa -- jū -- tu Te -- vi.
}


fullScore = <<
\new ChordNames { \chordsA }
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}
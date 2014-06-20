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
d1 a d a2:7 d
d\breve g4 d2 
d\breve a2 d
}

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 2/4

a8 g fis g | a4. d8 | a4 g | fis e| a8 g fis g | a d, e fis | e2 | d \bar"|." \break
\cadenzaOn
\repeat volta2 {a'\breve g8 b a4 \parenthesize a}
\repeat volta 2 {fis\breve e8 fis g b a4 \parenthesize a}
}

lyricA = \lyricmode {
Cil -- di -- nā -- sim Die -- vu, ze -- mes bēr -- ni, dzie -- dā -- sim par Vi -- ņa brī -- num -- dar -- biem!
\once \override LyricText #'self-alignment-X = #LEFT
"Viņš radījis ir" 
\once \override LyricText #'self-alignment-X = #CENTER
pa -- sau -- li, _
\once \override LyricText #'self-alignment-X = #LEFT
"Viņš radījis ir" 
\once \override LyricText #'self-alignment-X = #CENTER
de -- be -- sis un ze -- mi. }


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



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
b2.:min g4. d a fis b4:min fis8:min b4.:min
s8 b4.:min fis:min g d e2.:min fis:7 e4.:min e:min7 e2.:min6 fis
}

voiceA = \relative c'{
\clef "treble"
\key b \minor
\time 6/8

\repeat volta 2 { b8^\markup { \translate #'(-10 . 2) \italic Refrēns} d e fis4. | b8 a g fis4. | e8 d e fis4 fis8 | b b a b4. \break }
\partial 8
b8 | d d d cis d cis | b4. a4 a8 | g8 fis g b b a | fis2. |
e8 e e g g g | b4. b8 ais b | cis2. | cis \bar"|."
}

lyricA = \lyricmode {
Lai sla -- vēts Vārds, ko de -- vis Dievs, mū -- žī -- gi mū -- žos! Al -- le -- lu -- ja!
\set stanza = "1. "
Pie Te -- vis ir dzī -- vī -- bas a -- vots, kur ci -- tur lai mek -- lē -- jam to?
Tam, kas no a -- kas šīs dzers, tam ne -- slāps  mū -- žam.
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
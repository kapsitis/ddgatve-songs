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
e2.:min c2 a4:min b2 e:min
e1.:min c2.:6 c4 b s e1:min s4 c b2 e:min
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 3/4

e8 fis g4 a | b8 c b4 a | \time 4/4 b fis8 ([g]) e2 \bar"||" \break
\repeat volta 2 { \time 3/4
e'8^\markup {\translate #'(-10 . 0) \italic Refrēns } e d4 c | b8 a b4 r | c8 c b4 a |
g8 e fis4 r | e8 fis g4 a | b8 c b4 a | \time 4/4 b fis8 ([g]) e2 
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Ta -- vā pat -- vē -- ru -- mā stei -- dzam, Ma -- ri -- ja,
Ak, Ma -- ri -- ja, Ma -- ri -- ja, glā -- bē -- ja Tu
vie -- nī -- gā, lūdz par mums Tu dē -- lu sa -- vu Ma -- ri -- ja.
}
lyricB = \lyricmode {
Bē -- dās pa -- lī -- dzī -- bu lū -- dzam, Ma -- ri -- ja,
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



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
f2.. bes8 c1. c2:7 f4 f:sus4 f2 f1
}

voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 4/4

\repeat volta 2 {a4 a a4. f8 | g4 g g2 | e4 e e4. c8 }
\alternative {
  { f4 g a (f) }
  { f4 f f~ f \bar"|." }
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Ta -- vā sir -- dī dār -- gums mīt- Tas ir Jē -- zus, Die -- va Dēls. Die -- va Dēls.
}
lyricB = \lyricmode {
\set stanza = "2. "
Jē -- zus šo -- dien nāk pie mums dā -- vāt sa -- vu mī -- les -- tī__-__bu. mī -- les -- tī__-__bu.
}
lyricC = \lyricmode {
\set stanza = "3. "
Mī -- lē -- sim viens ot -- ru mēs, kā mūs Jē -- zus mī -- lē -- ja. mī -- lē -- ja.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



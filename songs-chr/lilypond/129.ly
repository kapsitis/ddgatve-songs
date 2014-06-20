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
g2.:min d4.:min g:min g4:min f8 bes4. f g:min
}

voiceA = \relative c' {
\clef "treble"
\key g \minor
\time 3/8

\repeat volta 2 { d8 d d | g4 g8 | f es f | g4 g8 | g g a | bes4 bes8 | a4 a8 | g4. } 
}

lyricA = \lyricmode {
\set stanza = #"1. "
Nāc ma -- nā sir -- dī, Mū -- žī -- gā Gais -- ma, nāc ma -- nī, Mī -- les -- tī -- bas Gars!
}
lyricB = \lyricmode {
\set stanza = #"2. "
Nāc ma -- nā sir -- dī, Gud -- rī -- bas Gars, nāc ma - nī, Mī -- les -- tī -- bas Gars!
}
lyricC = \lyricmode {
\set stanza = #"3. "
Nāc ma -- nā sir -- dī, Gars, kas dod spē -- ku, nāc ma -- nī, Mī -- les -- tī -- bas Gars!
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



\version "2.13.18"
#(ly:set-option 'crop #t)

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
\time 2/4
\repeat volta 2 { e8 e d d | e e d d | e4 d\fermata | e4 d\fermata | }
}

lyricAA = \lyricmode {
Kur te -- ce -- si tu pe -- li -- te? li -- go! li -- go!
}

lyricAB = \lyricmode {
Te -- ku pir -- ti ku -- ri -- na -- ti, li -- go! li -- go!
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
>>
}
>>

\score {
\fullScore
\header { piece = "__" opus = "__" }
}

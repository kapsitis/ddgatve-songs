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
d2:min a:min d4:min c f2 g4.:min c8:7 f4 bes g:min a:min d2:min
}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
%\dynamicUp

\repeat volta 2 {f8 f g f | e d e e | f4 (g8) g | a2 | bes8 c4 g8 | a (g) f d | f4 (e8) e | d2}
}

lyricA = \lyricmode {
Ir tik la -- bi pa -- ļau -- ties uz Te -- vi, Kungs. Ir la -- bi ce -- rēt uz Te -- vi, Kungs.
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



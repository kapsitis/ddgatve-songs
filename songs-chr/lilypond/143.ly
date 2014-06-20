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

%chordsA = \chordmode {}

voiceA = \relative c' {
\clef "treble"
\key d \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\repeat volta 2 {
\mark \markup {\circle \bold 1 }
d2 d | cis d \bar"||"
\mark \markup {\circle \bold 2 }
fis g | e4 e a2 \bar"||"
\mark \markup {\circle \bold 3 }
a4 a b b | a e fis2 \bar"||"
\mark \markup {\circle \bold 4 }
d e | a d,
}
}

lyricA = \lyricmode {
Re -- dzēt Die -- vu vē -- las ma -- na sirds un bez ga -- la prie -- cā -- ties, re -- dzot Die -- vu.
}


fullScore = <<
%\new ChordNames { \chordsA }
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



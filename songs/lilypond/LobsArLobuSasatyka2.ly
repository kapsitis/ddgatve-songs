\version "2.13.16"
%\header {
%    title = "Lobs ar lobu sasatyka"
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

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 3/4
a4. a8 a a | \time 2/4 a8 g fis e | \time 3/4 d4 b'2
\time 2/4
\repeat volta 2 {
b8 b a b | c8 b a4 | a8. g16 fis8 e | d2
}
} 



lyricA = \lyricmode {
Lobs ar lo -- bu sa -- sa -- ty -- ka, lei -- gū,
Stei -- dzēs ma -- ni ap -- ru -- nuot, trā -- di -- ral -- la -- lā.
}


fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



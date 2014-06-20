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


voiceA = \relative c' {
\clef "treble"
\key a \minor
\cadenzaOn
\time 2/4 s32
\time 2/4 s32
\time 3/4 s8
e8 e a4 \bar "|" b8 b c4 \bar "|" b8( a) gis gis a4 \bar "|"
e8 e a4 \bar "|" b8 b c4 \bar "|" b8( a) gis gis a4 \bar "||"
}

lyricA = \lyricmode {
Ky -- ri -- e, Ky -- ri -- e e -- le -- i -- son, 
Ky -- ri -- e, Ky -- ri -- e e -- le -- i -- son, 
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



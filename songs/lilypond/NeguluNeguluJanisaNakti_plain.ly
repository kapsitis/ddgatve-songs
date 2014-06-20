\version "2.13.16"
%\header {
%    title = "Negulu, negulu Jānīša nakti"
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


voiceA = \relative c' {
\clef "treble"
\key ees \major
\time 3/8
ees8 ees ees | aes8 g g | g8 f f | ees4 bes8 \time 6/8
ees4. g4. | f4. ees4. \time 3/8
ees8 ees ees | aes8 g g | g8 f4 | ees4 bes8 \time 6/8
ees4. g4. | f4. ees4. 
\bar "|."
} 


lyricA = \lyricmode {
Ne -- gu -- lu, ne -- gu -- lu, Jā -- nī -- ša  nak -- ti, 
lī -- go, lī -- go, 
lai ma -- ni ru -- dzī -- ši vel -- drē ne -- krīt, lī -- go, lī -- go!
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




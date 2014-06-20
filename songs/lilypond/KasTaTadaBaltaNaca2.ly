\version "2.13.16"
%\header {
%    title = "Kas tā tāda balta nāca?"
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
\key c \major
\time 4/2
c8 e g8. e16 f8. d16 e8. d16 e8 e d8. d16 c8 d e4
g8 g e8. e16 a8. a16 g8. g16 f8 f e8. e16 d8 c d4
\bar "|."
} 

lyricA = \lyricmode {
Kas tā tā -- da bal -- ta nā -- ca, 
Tum -- ša -- jā -- i va -- ka -- rā?
Kas tā tā -- da bal -- ta nā -- ca, 
Tum -- ša -- jā -- i va -- ka -- rā?
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




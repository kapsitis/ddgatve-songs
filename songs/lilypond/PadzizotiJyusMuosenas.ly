\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Padzīžoti jyus, muoseņas"
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
\time 4/4
d4 d d c | d4 f e e | f4 d d c | d4 f e e 
\time 2/4
d8 d d d | d8 d e4 | d8 d d d | d8 d e4
\bar "|."
} 



lyricA = \lyricmode {
Pa -- dzī -- žo -- ti jyus, muo -- se -- ņas, vy -- sas vī -- nā puļ -- ce -- ņā -- i!
Pa -- dzī -- žo -- ti jyus, muo -- seņ's, vy -- sas vī -- nā puļ -- ce -- ņā!
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



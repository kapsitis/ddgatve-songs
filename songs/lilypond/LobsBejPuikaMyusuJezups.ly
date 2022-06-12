\version "2.13.18"
#(ly:set-option 'crop #t)

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
\key d \minor
\time 2/4
a4. f8 | e8 d a' f | e8 d d a' | a8. g16 f8 e | d2 |
g4. bes8 | d8 d c bes | a8 d, d a' | a8. g16 f8 e | d2\fermata 
\bar "|."
} 



lyricA = \lyricmode {
Lobs bej’ pui -- ka myu -- su Je -- zups, Ti -- kai mo -- za au -- gu -- meņ’.
Lobs bej’ pui -- ka myu -- su Je -- zups, Ti -- kai mo -- za au -- gu -- meņ’.
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



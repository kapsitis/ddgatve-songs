\version "2.13.16"
%\header {
%    title = " Zīmyssvātki, svāta dīna ",Laivas lapas,Ziemassvētki
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
\time 2/4
c8 e e e |
f8 d d e |
d8 c d4 |
f8 e d4 |
d8 e e e |
f8 d d e |
d8 c d4 |
d8 c c4 |
\bar "|."
}

lyricA = \lyricmode {
Zī -- mys -- svāt -- ki, svā -- ta dī -- na, ka -- la -- dō, ka -- la -- dō,
nū -- za -- lai -- de le -- je -- ņā -- (i), ka -- la -- dō, ka -- la -- dō!
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



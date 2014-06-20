\version "2.13.16"
%\header {
%    title = "Kas duorzā?"
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
\time 4/4
g4 g8 a b4 a8 g | fis4 fis8 g a4 g8 fis |
e4 e8 fis g g fis e | d4 d d r
\bar "|."
} 



lyricA = \lyricmode {
Nū -- guo -- ja tē -- tei -- te,
Nū -- guo -- ja ma -- me -- ņa,
Nū -- guo -- ja bier -- _ ne -- ni
Iz me -- žu.
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



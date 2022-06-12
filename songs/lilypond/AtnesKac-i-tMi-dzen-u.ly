\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Atnes, kačīt, mīdzeņu"
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
\repeat volta 2 {
f8 f e e f4 d8 d | 
f8 f e e f d d r |
f8 d f d f d f r |
f8 d f d f d f r |
}
} 

lyricA = \lyricmode {
At -- nes, ka -- čīt, mī -- dze -- ņu
Mo -- za -- ja -- mi bier -- ne -- ņam. 
Ā __ _ _ _ _ _ _
ā __ _ _ _ _ _ _ 
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



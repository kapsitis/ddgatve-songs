\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nu ar Dievu, zaļa zāle"
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
\key a \minor
\time 2/4
a8 g a b |
c4 c |
b4. b8 |
a8 g a b |
c4 c |
b4. b8 |
e8 d c b |
d4 d |
d8[ e] f4 |
e8 d c b |
c4 b |
a2
\bar "|."
} 

lyricA = \lyricmode {
Nu ar Die -- vu, za -- ļa zā -- le, Nu ar Die -- vu, za -- ļa zā -- le, 
Vairs es te -- vis ne -- mī -- ņā -- šu, Vairs es te -- vis ne -- mī -- ņāš'.
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




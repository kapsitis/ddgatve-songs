\version "2.13.16"
%\header {
%    title = "Rūtoj bite, rūtoj saule"
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
bes16[ a] g8 a a | bes16[ a] g8 a a 
\time 3/4
f8[ bes16 a] a2 | g4 f2 
\time 2/4
bes8 g a a | bes g a a 
\time 3/4
f16[ g a bes] a2 | g16[ a g f] f2
\bar "|."
} 



lyricA = \lyricmode {
Rū -- toj bi -- te, rū -- toj sau -- le, rū -- tō, rū -- tō, 
pa le -- lu -- i tei -- ru -- me -- ņu, rū -- tō, rū -- tō!
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



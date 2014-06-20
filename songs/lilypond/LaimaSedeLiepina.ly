\version "2.13.16"
%\header {
%    title = "Laima sēde liepiņā"
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
\key f \major
\time 3/4
c4. a8 c c 
\time 2/4
c8 bes a g
\time 3/4
c4. a8 c c 
\time 2/4
c8 bes a g
\time 3/4
a4. bes16[ a] g8 a
\time 2/4
bes8 bes a g
\time 3/4
a4. bes16[ a] g8 a
\time 2/4
bes8 bes a4\fermata
\bar "|."
} 

lyricA = \lyricmode {
Lai -- ma sē -- de lie -- pi -- ņā -- i, 
Lai -- ma sē -- de lie -- pi -- ņā -- i, 
Bā -- re -- nī -- te zie -- dus la -- sa, 
Bā -- re -- nī -- te zie -- dus las'.
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




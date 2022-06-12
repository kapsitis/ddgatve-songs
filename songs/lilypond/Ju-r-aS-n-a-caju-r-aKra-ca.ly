\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jūŗa šņāca,jūŗa krāca",AA lapas
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
\key a \minor 
\time 9/4
c'8[ b16] a16 c8 a e' e g4. e8 g e d[ c16] b e8 d e8. b16 |
\time 4/2 
c8 b a g a b d b e e e8. d16 c8 b a4 |
\bar "|."
}
 

lyricA = \lyricmode {
Jū -- ŗa šņā -- ca, jū -- ŗa krā -- ca, ko tā jū -- ŗa ap -- ri -- ju -- se?
Jū -- ŗa šņā -- ca, jū -- ŗa krā -- ca, ko tā jū -- ŗa ap -- ri -- jus?
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



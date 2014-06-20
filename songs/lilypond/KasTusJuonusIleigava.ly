\version "2.13.16"
%\header {
%    title = "Kas tūs Juoņus īleigava"
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
\key e \minor
\time 2/4
a8 g fis g | e8 d e d \time 3/4 e8[ fis] g2 | fis4 e2 
\time 2/4
a8 g fis g | e d e d \time 3/4 e4 g2 | fis4 e2
} 

lyricA = \lyricmode {
Kas tūs Juo -- ņus ī -- lei -- ga  -- va, lei -- gū, lei -- gū, 
myu -- su po -- šu cī -- ma ļau -- dis, lei -- gū, lei -- gū!
} 


voiceB = \relative c'' {
\clef "treble"
\key e \minor
\time 2/4
a8 g fis g | e8 d e d \time 3/4 e4 e2 | dis4 e2 
\time 2/4
fis8 e d e | e d e d \time 3/4 e4 e2 | dis4 e2
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



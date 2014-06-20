\version "2.13.16"
% \header {
% title = "Visi gani mājās dzina"
% }
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


voiceA = {
\clef "treble"
\key f \major
\time 2/4
a8 a c' c' | f' f' g' g' |
a' f' f'8. d'16 | d'8 c' c'4 |
f'8. a16 a8. a16 | d'8 e' f'4 |
f'8 f' f'8. c'16 | c'8 bes a4  
\bar "|."
} 

lyricA = \lyricmode {
Vi -- si ga -- ni mā -- jās dzi -- na, 
vi -- siem vār -- tu vē -- rē -- jiņ'.
Rai -- du, rai -- du, rai, dai, dai, 
vi -- siem vār -- tu vē -- rē -- jiņ'.
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




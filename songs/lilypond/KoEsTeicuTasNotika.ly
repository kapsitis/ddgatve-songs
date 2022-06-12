\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ko es teicu, tas notika"
%}
% Budēlīši, p.103
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
\key g \major
\time 5/8 d'4 b8 d b
\time 2/4 a8 g fis e | d8 d' b4 |
a8 g fis e | e8 d d d | d'8 d e fis16 e | d2 
\bar "|." 
} 

lyricA = \lyricmode {
Ko es tei -- cu, tas no -- ti -- ka, ai, ku -- kū! 
Lie -- lam kro -- ga dzē -- rā -- jam, Ai, si -- lā li -- ni -- ņi zied!
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



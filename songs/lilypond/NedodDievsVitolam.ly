\version "2.13.16"
%\header {
%    title = "Nedod, Dievs, vītolam"
%}
% Budēlīši, p.106
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
\time 2/4 g8 b d8. d16 | g8 g fis4 | g8 e d8. b16 | c8 a b g | d'4 e | d8 b c[ g] | a4 g   
\bar "|." 
} 

lyricA = \lyricmode {
Ne -- dod, Diev -- si, vī -- to -- lam, vī -- to -- la -- mi, vī -- to -- la -- mi
bal -- tiem zie -- diem no -- zie -- dēt. 
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



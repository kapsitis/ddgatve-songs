\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nāc, Dieviņi, uz manīmi"
%}
% Laivas pasākums, p.6
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
\time 2/4
c8 c e8. c16 | e8 d c c | e8 f g8. e16 | g8 g f a | 
g8 g f8. d16 | e16[ f] g8 c, c | d8 e f8( e16) d | c8 <<g c>> c4  
\bar "|."
} 

lyricA = \lyricmode {
Nāc, Die -- vi -- ņi, uz ma -- nī -- mi
Šo -- va -- ka -- ru va -- ka -- rē -- ti! 
Nāc, Die -- vi -- ņi, uz ma -- nī -- mi
Šo -- va -- ka -- ru va -- ka -- rēt! 
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




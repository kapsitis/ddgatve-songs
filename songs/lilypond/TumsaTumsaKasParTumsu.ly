\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumsa, tumsa, kas par tumsu"
%}
% Spēka dziesmas; p.18
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
\time 3/4
f8 f a16 a g f g8( a16) g | f8 f a16 a g f g8( a16) g |
d8 d a'16 a g f c8( f16) e | d8 d a'16 a g f c4 
\bar "|."
} 

lyricA = \lyricmode {
Tum -- sa, tum -- sa, kas par tum -- su,
Tum -- sa, tum -- sa, kas par tum -- su, 
Es par tum -- su ne -- bē -- dā -- ju, 
Es par tum -- su ne -- bē -- dāj'. 
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



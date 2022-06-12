\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aiz kalniņa dūmi kūp"
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
\key c \major
\time 2/4
g8 e16[ f] g8 e16[ f] | g8 f16[ e] d8 d | 
g8 g f f | e8 d c4 |
g'8 e16 f g4 | g8 e16 f g8 e16 f | 
g8 f16 e d4 |
g8 g f f | e8 d c4 |
\bar "|."
} 

lyricA = \lyricmode {
Aiz kal -- ni -- ņa dū -- mi kū -- pa. 
Kas tos dū -- mus kū -- pi -- nāj?
Nu ti -- ka tā. Tim -- ba -- ka, 
tai -- ba -- ka til -- li -- di -- rā
Kas tos dū -- mus kū -- pi -- nāj?
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



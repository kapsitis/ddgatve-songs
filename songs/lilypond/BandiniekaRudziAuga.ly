\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Bandinieka rudzi auga"
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
\clef treble
\key d\major  
\time 3/4  
\override Staff.TimeSignature #'style = #'()
d4 a' a8 a \time 4/4 
a4 d a4. fis8 \time 3/4
b4 g g8 g \time 4/4 
g4 b a4. fis8 \time 3/4
a4 fis e8 d \time 4/4
e4 fis8[ g8] a4. fis8 \time 3/4
a4 fis e8 d8 \time 4/4
fis4 e d2 
\bar "|."
}

lyricA = \lyricmode {
Ban -- di -- nie -- ka ru -- dzi au -- ga, 
ban -- di -- nie -- ka ru -- dzi au -- ga
di -- ža me -- ža ma -- li -- ņā -- i, 
di -- ža me -- ža ma -- li -- ņā. 
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



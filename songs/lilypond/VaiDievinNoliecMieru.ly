\version "2.13.16"
%\header {
%    title = "Vai, Dieviņ, noliec mieru"
%}
%#(set-global-staff-size 18)
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
\key d \minor
\time 12/8
f,8 d f4 a a8 f g[ f] a4 |
f8 d f4 g e8 f16[ e] d2 
\repeat volta 2 {
d'8 c d4 a c8 bes a4 g |
f8 d f4 g e8 f16[ e] d2
}
\bar "|."
} 

lyricA = \lyricmode {
Vai, Die -- vi -- ņi, no -- liec mie -- ru, 
No -- joz ka -- ra zo -- ben -- tiņ';
Ka -- rā ma -- nus brā -- ļus jē -- ma, 
Ka -- rā ma -- nus bā -- le -- liņ's.
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




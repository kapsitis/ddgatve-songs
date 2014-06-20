\version "2.13.16"
%\header {
%    title = "Ziema brauca mīkstu ceļu"
%}
% F/g "Laiva", rokraksts - laivas_pasakums.pdf, p.1
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
\time 2/4
\clef "treble"
\key c \major
\time 4/4
c4 d e e | f8[ e] d4 c g | 
c4 d e e | f8[ e] d4 c2 | 
e4 f g g | a8[ g] f4 e c | 
c4 d e e | f8[ e] d4 c2
\bar "|."
} 


lyricA = \lyricmode {
Zie -- ma brau -- ca mīk -- stu ce -- ļu, bal -- tu snie -- gu pu -- ti -- nāj';
Zie -- ma brau -- ca mīk -- stu ce -- ļu, bal -- tu snie -- gu pu -- ti -- nāj'.
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



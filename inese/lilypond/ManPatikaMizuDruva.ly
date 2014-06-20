\version "2.13.16" 
%\header {
%    title = "Man patika mīžu druva"
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
\key cis \minor
\time 4/4 
e4 fis16[ e8.] d16[ cis8.] e4 | cis4 e dis e \break
\time 5/4
fis8 e dis cis e dis16[\glissando cis] cis2 \break
\time 4/4
e4 fis cis fis8[ e] | e8[ dis] e[ dis]\glissando cis2\longfermata
\bar "|."
} 



lyricA = \lyricmode {
Man pa -- ti -- ka mī -- žu dru -- va 
Ai vu -- sī  -- mi o -- kū -- tīm,
Ai vu -- sī  -- mi o -- kū -- tīm.
}

lyricB = \lyricmode {
Ai vu -- sī  -- mi o -- kū -- tīm.
}


voiceB = \relative c' {
\clef treble 
\key cis \minor
\time 4/4 
R1 | R1 
\time 5/4
fis8 e dis cis e dis16[ cis] cis2~ 
\time 4/4
cis1~ | cis1\longfermata
\bar "|."
} 




fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricB
>>
}
>>
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



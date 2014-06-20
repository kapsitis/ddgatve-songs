\version "2.13.16"
%\header {
%    title = "Čigāns savu čigāniet'"
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



voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
%MS
e8^"Teicēja" g e e | e8 b e4 | e8 e e e | e8 dis e4 |
%ME 
e8 dis e e | e8 b e4 | e8 b e dis | e8 b e4~ | e2~ | e8 r8 r4
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
e8^"Locītājas" dis e4 | e8 dis e4 | e8 dis e4 | e8 dis e4 | 
e8 dis e4 | e8 dis e4 | e8 dis e4 | e8 dis e4~ | e2~ | e8 r8 r4
\bar "|."
} 


lyricA = \lyricmode {
\set stanza = #"1." Či -- gāns sa -- vu či -- gā -- niet' ik va -- ka -- ra te -- te -- rēj', 
Či -- gāns sa -- vu či -- gā -- niet' ik va -- ka -- ra te -- te -- rēj'.
}

lyricB = \lyricmode {
Ko -- la -- do, ko -- la -- do, Ko -- la -- do, ko -- la -- do, 
Ko -- la -- do, ko -- la -- do, Ko -- la -- do, ko -- la -- do!
}



fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
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



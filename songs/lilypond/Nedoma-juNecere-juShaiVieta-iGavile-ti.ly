\version "2.13.16"
%\header {
%    title = "Nedomāju, necerēju šai vietai gavilēti",AA lapas, Gavilēšana
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
\clef "treble"
\key c \major
\time 2/4 
d8 d c d |
f8 e16[ d] d8 d |
e8 d cis cis |
cis8 d cis d |
f8 e16[ d] d8 d |
d8 d cis d |
f8 e16[ d] d8 d |
d8 d cis d\fermata | 
\bar "|."
} 

lyricA = \lyricmode {
Ne -- do -- mā -- ju, ne -- ce -- rē -- ju 
šai vie -- tā -- i ga -- vi -- lē -- ti; 
Ne -- do -- mā -- ju, ne -- ce -- rē -- ju 
šai vie -- tā -- i ga -- vi -- lē -- ti.
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



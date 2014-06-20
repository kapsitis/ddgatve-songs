\version "2.13.16"
%\header {
%    title = "Divi dienas mežā gāju"
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
\key c\major
\time 4/4
c4 e g g | c g e g | 
g4. f8 d4 f | e4. d8 c2 |
c4 e g g | c c c e | 
d4. c8 b4 a | g a8[ b8] c2 
\bar "|."
}


lyricA = \lyricmode { 
Di -- vi die -- nas me -- žā gā -- ju, 
it ne -- nie -- ka ne -- re -- dzēj'.
Di -- vi die -- nas me -- žā gā -- ju, 
it ne -- nie -- ka ne -- re -- dzēj'.
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



\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kad es gāju jūriņāi"
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
c8\fermata d g, g |
c8 c c c |
c8 c c c |
\time 4/4 
c4 c8[ d] d2 |
d4 d e4. d8 |
d8[ c] c4 c c |
d4 d e4. d8 |
d8[ c] c4 <<c2 d e>> |
\bar "|."
} 


lyricA = \lyricmode {
Kad es gā -- ju jū -- ri -- ņā -- i, jū -- riņ ma -- na mā -- mu -- liņ';
kad es gā -- ju jū -- ri -- ņā -- i, jū -- riņ ma -- na mā -- mu -- liņ';
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




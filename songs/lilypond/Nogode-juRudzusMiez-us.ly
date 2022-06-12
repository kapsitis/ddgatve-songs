\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nogodēju rudzus, miežus ",Laivas lapas,Mārtiņi
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
\time 4/4
c4 d e e |
f8[ e] d4 c g |
c4 d e e |
f8[ e] d4 c2 |
e4 f g g |
a8[ g] f4 e c |
c4 d e e |
f8[ e] d4 c2 |
\bar "|."
}

lyricA = \lyricmode {
 No -- go -- dē -- ju ru -- dzus, mie -- žus, no -- go -- dē -- ju a -- pe -- nīš', 
 no -- go -- dē -- ju ru -- dzus, mie -- žus, no -- go -- dē -- ju a -- pe -- nīš'.
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



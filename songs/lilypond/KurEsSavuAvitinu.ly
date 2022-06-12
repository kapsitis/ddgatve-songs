\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kur es savu avitiņu"
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
\key g \major
\time 2/4
g8. g16 c8. b16 | b8. a16 a8 g | g8. g16 c8. b16 | b8. a16 a8 g8 |
b8 b a a | a8 a g4 | b8 b a a | a8 g a4 
\bar "|."
} 

lyricA = \lyricmode {
Kur es sa -- vu a -- vi -- ti -- ņu svē -- tu rī -- tu pa -- ga -- nī -- šu?
Kur es sa -- vu a -- vi -- tiņ' svē -- tu rī -- tu pa -- ga -- nīš'?
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




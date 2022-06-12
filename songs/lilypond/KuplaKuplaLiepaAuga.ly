\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kupla, kupla liepa auga"
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
\repeat volta 2 {
g'8 g a a | g g e e | 
f f d d | c c c4
}
\repeat volta 2 {
d4 d4 | d8 b' b4 | 
c8 c a a g g g4 
}
} 

lyricA = \lyricmode {
Kup -- la, kup -- la lie -- pa au -- ga 
ma -- na tē -- va lai -- da -- rā.
Ai -- jā tra -- la -- lā 
ma -- na tē -- va lai -- da -- rā.
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



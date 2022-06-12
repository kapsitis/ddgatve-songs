\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Bēdu, manu lielu bēdu"
%}
% Austras dziesmu burtnīca, 5.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
d8 d fis( e16) d | cis8 b a8. a16 | e'8 e g( fis16) e | e8 d8 d4 
}
\repeat volta 2 {
a'8 a a a | b16 a g fis e8. d16 | cis8 a a( b16) cis | d8 d d4  
}
}


lyricA = \lyricmode {
Bē -- du, ma -- nu lie -- lu bē -- du, es par bē -- du ne -- bē -- dāj'!
Ram -- tai ram -- tai ra -- di -- ri -- di -- rī -- di, ram -- tai rī -- di ral -- lal -- lā! 
}


chordsA = \chordmode {
\repeat volta 2 { 
d2:5 | a2:5 | a2:7 | d2:5 
}
\repeat volta 2 { 
d4:5 d4:7 | g4:5 e4:m | a2:7 | d2:5
}
}



fullScore = <<
\new ChordNames { \chordsA }
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



\version "2.13.16"
%\header {
%    title = "Jānīts savu kumeliņu"
%}
% Katrīna Riekstiņa, #47 (Grodi)
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
e8 g g g g e d e | f4 e f8[ g] g4 |
\repeat volta 2 {



 \oneVoice 
<< { a8 f g a g e d g } 
\new Staff \with {
\remove "Time_signature_engraver"
%\remove "Clef_engraver"
%\remove "Key_engraver"
%\remove "Accidental_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
} { 
  \key c \major
  << { \voiceOne \autoBeamOff s2 g8 e d f  }
  \new Voice { \voiceTwo \autoBeamOff s2 e8 c b d } >>    
}
>> \oneVoice


}
\alternative { { f4 e f8[ g] g4 } { f4 e2. } }
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
c8 e e e e c b c | d4 c d8[ e] e4 |
\repeat volta 2 {
f8 d e f e c b d
}
\alternative { { d4 c d8[ e] e4 } { d4 c2. } }
} 


lyricA = \lyricmode {
Jā -- nīts sa -- vu ku -- me -- li -- ņu, 
lī -- go, lī -- go, 
jū -- ri -- ņā -- i pel -- di -- nā -- ja, 
lī -- go, lī -- go, 
lī -- go. 
}

chordsA = \chordmode {
c1:5 | g4:5 c4:5 g2:5 | 
\repeat volta 2 {
g1:5 |
}
\alternative { { g1:5 } { g4:5 c2.:5 } }
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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




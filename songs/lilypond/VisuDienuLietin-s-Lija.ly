\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Visu dienu lietiņš lija" 
%}
% Sal. 3x9 Jāņi; 42.lpp.; Es sakūru uguntiņu...
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
e8 e e fis | g8 fis e fis | g4 fis\fermata | g4 fis\fermata
e8 e e fis | g8 fis e fis | 
<< { g4 fis\fermata | g4 fis\fermata } 
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
} { 
  \key e \minor
  << { \voiceOne \autoBeamOff <<g4 c>> <<a c>> | <<g4 c>> <<a c>> }
  \new Voice { \voiceTwo \autoBeamOff e,4 e | e4 e } >>    
}
>> 
\bar "|."
} 

lyricA = \lyricmode {
Vi -- su die -- nu lie -- tiņš li -- ja, lī -- go, lī -- go,
Vēl līst Jā -- ņu va -- ka -- rā -- i, lī -- go, lī -- go!
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



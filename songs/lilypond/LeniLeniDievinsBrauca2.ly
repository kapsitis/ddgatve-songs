\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lēni, lēni Dieviņš brauca"
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
\key a \minor
\time 5/4
c'4. b8 a g a e e e 
\time 6/2
a8 a a b c4 c8[ d8] e4. d8 


\oneVoice 
<< { c c b b c4 b a2 } 
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
  \key a \minor
  << \new Voice = "voiceAB" { \oneVoice \autoBeamOff c4 b8[ g] a1 }
  \new Lyrics \lyricsto "voiceAB" { le -- ji -- ņā. } >>    
}
>> \oneVoice



\bar "|."
} 

lyricA = \lyricmode {
Lē -- ni, lē -- ni Die -- viņš brau -- ca 
No kal -- ni -- ņa le -- ji -- ņā -- ji, No kal -- ni -- ņa le -- ji -- ņā.
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




\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
%    title = "Zīdēj' bolta uobelīte"
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


%\layout {
%  \context {
%    \RemoveEmptyStaffContext
%    % To use the setting globally, uncomment the following line:
%    \override VerticalAxisGroup #'remove-first = ##t
%  }
%}


voiceA = \relative c' {
\tempo 4=96
\clef treble 
\key b \major
\time 4/4 
\partial 16*1
s16 \bar ""
b8 b dis dis fis fis fis fis |
b8 dis, fis b, dis cis cis4 |
ais16 ais ais ais cis cis cis cis e8 e gis4 | 
fis8 fis e cis b b b4 |
<< { \voiceOne b'8 b gis gis e e e e }
\new Voice { \voiceTwo \autoBeamOff gis8 gis s2. }
>> \oneVoice 
<< { gis8 gis b gis } 
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
  \key b \major
  << { \voiceOne \autoBeamOff gis8 b b gis }
  \new Voice { \voiceTwo \autoBeamOff gis8 gis gis gis } >>    
}
>> \oneVoice
gis fis fis4 |
b,16 b b b dis dis dis dis fis8 fis gis4 | 
fis8 fis e cis b b b4 
\bar "|."
} 


lyricA = \lyricmode {
Zī -- dēj' bol -- ta uo -- be -- lī -- te 
Po -- pu -- vī -- tes ma -- li -- ņā, 
Tra -- di -- ri -- di -- ri -- di -- ri -- di ra -- la -- lā, 
Po -- pu -- vī -- tes ma -- li -- ņā.
Jou -- nī pui -- ši at -- ī -- da -- mi, 
Tī puš -- ko -- va ca -- pu -- rīt', 
Tra -- di -- ri -- di -- ri -- di -- ri -- di ra -- la -- lā, 
Tī puš -- ko -- va ca -- pu -- rīt'.
}


voiceB = \relative c' {
\clef treble 
\key b \major
\time 4/4 
\partial 16*1
s16 \bar ""
<< {
  r2 dis8 b b b | 
  << { \voiceOne b8 b dis b b ais ais4 }
  \new Voice { \voiceTwo s4 b8 s8 s2 }
  >> 
}
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
  \key b \major
  \oneVoice \autoBeamOff b8 b b b << { \voiceOne dis8 dis dis dis | dis8 b dis b dis cis cis4 }
  \new Voice { \voiceTwo \autoBeamOff b8 b b b | b8 b b b b ais ais4 } >>    
}
>>
\oneVoice
fis16 fis fis fis ais ais ais ais cis8 cis e4 | 
dis8 dis cis ais b b b4
e8 e e e e e e e | 
<< { \voiceOne e e e e e dis dis4 |
b16 b b b b b b b dis8 dis e4 | 
dis8 dis cis ais b b b4 }
\new Voice { \voiceTwo \autoBeamOff s2 s8 b8 b4 |
s2 b8 b s4 | 
b8 b s2. 
}
>>
\bar "|."
} 


fullScore = <<
\new ChoirStaff <<
\set StaffGroup.systemStartDelimiterHierarchy
    = #'(SystemStartBrace (SystemStartBracket a (SystemStartSquare b) ) c ) 
\new Staff = "upper" {<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
>>}
\new Lyrics \lyricsto "voiceA" \lyricA
\new Staff = "lower" {<<
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
>>}
>>
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



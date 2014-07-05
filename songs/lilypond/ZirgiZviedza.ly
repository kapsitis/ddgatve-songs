\version "2.13.16"
%\header {
%    title = "Zirgi zviedza"
%}
% Skyforger, http://www.youtube.com/watch?v=O-h8AWK4OcE
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
\key d \minor
\time 2/4
\partial 4*1
\repeat volta 2 {
bes'8 bes | a4 a | bes8 a g f16\( e\) | d4 a' | f8 f8 f16[ g] a8 | g8 f16[ e] d4~ | d4
}
} 

lyricA = \lyricmode {
Zir -- gi zvie -- dza, ai -- jā, jo -- di _ brau -- ca, 
u -- pīt'  te -- cēj'  čurk -- stē -- dam',
} 

lyricB = \lyricmode {
Ai -- jā ri -- di, ai -- jā, rid -- ri -- di ral -- lā
_ _ _ _ _ _ _
}

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\partial 4*1
\repeat volta 2 {
g'8 g | f4 f | g8 f e e | d4 f | d8 d d d8 | 


<< { cis8 cis d4~ | d4 } 
\new Staff \with {
\remove "Time_signature_engraver"
%\remove "Clef_engraver"
%\remove "Key_engraver"
%\remove "Accidental_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}  
\new Voice = "voiceAB" { \voiceTwo \autoBeamOff a8 a d4~ | d4 }
>> 

}
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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




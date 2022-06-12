\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tur spīda, kas tur mirdza"
%}
% 3x9 Jāņi; p.46
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
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 3/4 \mark \markup {  \circle \bold A }
e8 g g4 e | a8 g fis4 e | \mark \markup {  \circle \bold B }

\oneVoice 
<< { e8 g g4 e | a8 g fis4 e |  } 
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
  \key e \minor
  << { \voiceOne \autoBeamOff b'8 b b4 b | c8 b8 b4 b }
  \new Voice { \voiceTwo \autoBeamOff e,8 e e4 e | d8 d d4 e } >>    
}
>> \oneVoice


\time 2/4
g8 a g e | 
\time 4/4
g8 e4( fis8) g e4. 
\bar "|."
} 

lyricA = \lyricmode {
Kas tur spī -- da, kas tur mir -- dza, 
Kas tur spī -- da, kas tur mir -- dza, 
Di -- ža me -- ža ma -- li -- ņā -- i. 
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



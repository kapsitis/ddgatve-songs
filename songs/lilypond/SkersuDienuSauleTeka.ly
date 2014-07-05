\version "2.13.16" 
%\header {
% title = "Šķērsu dienu saule teka"
%}
% Austras dziesmu burtnīca, 28.lpp.
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
\key e \minor
\time 4/4
e8 fis g fis a g fis e | e8 fis g fis a g fis e | 
b'4 b8[ g] a g b a | 


 

\oneVoice 
<< { e4 e8 fis g fis a g | e2. r4 } 
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
  << \new Voice = "voiceAB" { \oneVoice \autoBeamOff e2.( d4 | e2.) r4 }
  \lyricsto "voiceAB" \new Lyrics { tiņš. } >>    
}
>> \oneVoice


\bar "|."
}


lyricA = \lyricmode {
Šķēr -- su die -- nu sau -- le te -- ka,
Šķēr -- su die -- nu sau -- le te -- ka, 
nak -- tī šķēr -- su mē -- nes -- tiņš, 
nak -- tī šķēr -- su mē -- nes -- tiņš.
}


chordsA = \chordmode {
\time 4/4
e2:m a4:m e4:m | s2 a4:m  e4:m | 
g2:5 a2:m | e2.:m d4:5 | e2.:m
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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



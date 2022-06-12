\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%  title = "Trīs kalniņi noziedēja"
%    title = "Jānīts brauca katru gadu" 
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


voiceA = \transpose d c  { \relative c' {
\clef "treble"
\key d \major
\time 2/4
fis8\fermata e e d | d8 fis d e | 
fis8 e d e | fis8 e d e | 
fis8 e fis fis | g8 fis e4\fermata | 
e8 fis e8. e16 | e8 fis e8. d16 | 
e8 fis e8. d16 | fis8 e e4\fermata |
s2
\bar "|."
} }

lyricA = \lyricmode {
Trīs kal -- ni -- ņi no -- zie -- dē -- ja  
Sar -- ka -- nā -- i ā -- bo -- li -- ņa. 
Trīs kal -- ni -- ņi no -- zie -- dēj'   
Sar -- ka -- nā -- i ā -- bo -- li -- ņa, 
Sar -- ka -- nā -- i ā -- bo -- liņ'.
%Jā -- nīts brau -- ca kat -- ru ga -- du, 
%at -- ved zā -- ļu ve -- zu -- mi -- ņu.
%Jā -- nīts brau -- ca kat -- ru gad', 
%at -- ved zā -- ļu ve -- zu -- mi -- ņu, 
%at -- ved zā -- ļu ve -- zu -- miņ'.
}

voiceB = \transpose d c  { \relative c' {
\clef "treble"
\key d \major
\time 2/4
s2 | s2 | s2 | s2 | s2 | s2
<< a2~ d2~ >> | << a2~ d2~ >> |
<< a2~ d2~ >> | << a2~ d2~ >> |
<< a2 d2 >> 
} }

lyricB = \lyricmode {
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ 
Ē! __ _ _ _ _ _ _ _ _ _ _ _ _ _
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricB
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



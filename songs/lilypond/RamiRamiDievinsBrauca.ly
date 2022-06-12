\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Rāmi, rāmi Dieviņš brauca"
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
\key d \minor
\time 2/4
\oneVoice
d8 e f e | g8 f e d | f8. e16 d4 | f8. e16 d4 | d8 e f f | g8 f e d | f8. e16 d4 | f8. e16 d4 
\voiceOne
\time 3/4 
a'4. f8 g f 
\time 2/4
e8. d16 d8 e | f8. e16 d4 | f8. e16 d4  
\time 3/4 
a'4. f8 g f 
\time 2/4
e8. d16 d8 e | f8. e16 d4 | f8. e16 d4
} 

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2 
\time 3/4
d4. d8 c c 
\time 2/4
c8. d16 d8 d | d8. d16 d4 | d8. d16 d4
\time 3/4
d4. d8 c c 
\time 2/4
c8. d16 d8 d | d8. d16 d4 | d8. d16 d4
}

lyricA = \lyricmode {
Rā -- mi, rā -- mi Die -- viņš brau -- ca, ka -- la -- dū, ka -- la -- dū, 
no kal -- ni -- ņa le -- ji -- ņā -- i, ka -- la -- dū, ka -- la -- dū. 
Rā -- mi, rā -- mi Die -- viņš brau -- ca, ka -- la -- dū, ka -- la -- dū, 
no kal -- ni -- ņa le -- ji -- ņā -- i, ka -- la -- dū, ka -- la -- dū. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



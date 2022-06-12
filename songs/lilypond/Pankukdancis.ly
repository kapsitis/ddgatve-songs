\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Rīgas Pankūkdancis"
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
\clef treble
\key d\major 
\time 2/4
\override Score.BarNumber 
#'break-visibility = #end-of-line-invisible
\break

\repeat volta 2 {
fis8 a a a | fis a a a | 
g8. a16 g8 fis | e2 | 
e8 g g g | e8 g g g | 
fis8. g16 fis8 e | 
d2 
}
\repeat volta 2 {
b'4 b | b8 cis d b  | 
a8.[ g16] fis8[ g] | a2
} 
\repeat volta 2 {
e8 g g g | e8 g g g | 
fis8. g16 fis8 e | d2 
}
} 

lyricA = \lyricmode {
Ce -- pa, ce -- pa, ce -- pa, ce -- pa mā -- te pan -- kū -- kas,
Ce -- pa, ce -- pa, ce -- pa, ce -- pa mā -- te pan -- kū -- kas. 
Jā! jā! kar -- tu -- pe -- ļu pan -- kū -- kas. 
Ce -- pa, ce -- pa, ce -- pa, ce -- pa mā -- te pan -- kū -- kas. 
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





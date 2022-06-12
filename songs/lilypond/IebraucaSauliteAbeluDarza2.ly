\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Iebrauca saulīte ābeļu dārzā"
%}
% F/g "Laiva", rokraksts - dzeltena_mape.pdf, p.22
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
\time 3/8
\clef "treble"
\key c \major
\override Voice.TextScript #'font-family = #'sans
\override Voice.TextScript #'font-size = #-1
\oneVoice
e8 f e | 
e8 d c | 
e8 f e | 
e16[ d] d4 \break
\voiceOne
d8 f e | 
f8 e d16[ c] | 
e8 f e | 
e4. 
\bar "|."
}



lyricA = \lyricmode {
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dār -- zā, 
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dārz'.
} 


voiceB = \relative c' {
\time 3/8
\clef "treble"
\key c \major
\override Voice.TextScript #'font-family = #'sans
\override Voice.TextScript #'font-size = #-1

s4. | 
s4. | 
s4. | 
s4. \break

d8 d d | 
d8 d d | 
c8 c c | 
c4. 
\bar "|."
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



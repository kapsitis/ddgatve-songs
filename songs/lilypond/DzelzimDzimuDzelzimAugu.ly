\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Dzelzim dzimu, dzelzim augu"
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
\key c \major
\time 3/4
c4 c c8 b | c8 b c4 c | c4 c c8 b | c8 b c4 c |
c4 c c8 b \time 2/4 
c8 b c4 \time 3/4    
c4 c c8 b \time 2/4 
c8 b c4
\bar "|."    
} 



lyricA = \lyricmode {
Dzel -- zim dzi -- mu, dzel -- zim au -- gu, 
Dzel -- zim dzi -- mu, dzel -- zim au -- gu,
Dzel -- zim sa -- vas kā -- jas āv',
Dzel -- zim sa -- vas kā -- jas āv',
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



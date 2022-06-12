\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Karavīra līgaviņa"
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


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 7/2
g4 d' c( b8) c g8[ a] b[ g] c4. d8 e4 g4 d4. g8 e c d f |
e8 e d c e8.[ d16] c8[ a] g4. f'8 e e d c e8.[ d16] c8[ a] g1
\bar "|."
} 

lyricA = \lyricmode {
Ka -- ra -- vī -- ra lī -- ga -- vi -- ņa, 
Ka -- ra -- vī -- ra lī -- ga -- vi -- ņa
Sēd aiz gal -- da rau -- dā -- da -- ma, 
Sēd aiz gal -- da rau -- dā -- dam'.
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




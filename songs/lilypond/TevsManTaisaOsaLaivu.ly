\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tēvs man taisa oša laivu"
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
\key g \major
\time 3/4
b'4. g8 b b | a4. fis8 d d | 
b'4. g8 b b | a4. fis8 d d 
\time 2/4 
a'8 a a c 
\time 4/4
b4 a g2
\bar "|."
} 


lyricA = \lyricmode {
Tēvs man tai -- sa o -- ša  lai -- vu, 
tēvs man tai -- sa o -- ša lai -- vu, 
Lī -- kus ko -- kus ē -- ve -- lē.  
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



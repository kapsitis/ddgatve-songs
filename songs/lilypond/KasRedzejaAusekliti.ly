\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas redzēja Auseklīti"
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
\time 3/4
d4 a'4 a8 a | g8 f e4 d | d4 a'4 a8 a | g8 f e4 d \time 2/4
d8 e f f | g8 e d4 | d8 e f f | g8 e d4 
\bar "|."  
} 



lyricA = \lyricmode {
Kas re -- dzē -- ja Au -- sek -- lī -- ti, 
Kas re -- dzē -- ja Au -- sek -- lī -- ti, 
Va -- ka -- rā -- i uz -- le -- cam,
Va -- ka -- rā -- i uz -- le -- cam?
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



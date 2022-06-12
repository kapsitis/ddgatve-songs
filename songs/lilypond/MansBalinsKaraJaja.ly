\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Mans bāliņš karā jāja"
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
\time 5/1
d,8[ e] f4 e8[ d] e4 d8[ e] f4 e8[ d] e4 d8[ e] f4 e4. c8 d4 d a4. b8 c4 d a2
\time 6/2
f'4( g) a2 g4 a f e d1
\bar "|."
} 

lyricA = \lyricmode {
Mans bā -- li -- ņis ka -- rā jā -- ja ne -- puš -- ķo -- tu ce -- pu -- rī -- ti, ce -- pu -- rīt',
Ne -- puš -- ķo -- tu  ce -- pu -- rīt'.
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




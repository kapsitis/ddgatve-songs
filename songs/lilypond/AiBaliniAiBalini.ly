\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, bāliņi, ai, bāliņi"
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
\key c \minor
\time 4/4
c,4. d8 ees4 c |
f4. aes8 g4 c,
\time 2/4
c8 d ees f 
\time 4/4
g4 g c,2 
\repeat volta 2 {
g'4. ees'8 d4 c |
bes4 f8[ g] aes4 g 
\time 2/4
c,8 d ees f 
\time 4/4
g4 g c,2 
}
} 

lyricA = \lyricmode {
Ai, bā -- li -- ņi, ai, bā -- li -- ņi, 
Ņem zo -- be -- nu ro -- ci -- ņā, 
Ņem zo -- be -- nu ro -- ci -- ņā -- i, 
Sar -- gā sa -- vu tē -- vu zem'.
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



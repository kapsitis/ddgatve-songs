\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Čigāniņi, bāleliņi
\layout {
indent = #0
ragged-last = ##f
}





chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 | 
c2:5 | c2:5 | c2:5 | c2:5 | 
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
%MS
e8 c c c |
c8 e c c | 
c8 e d c |
e8 c c4 |
%ME
e8 d e4 |
e8 d e4 |
e8 e e d |
e8 e e4 |
\bar "|."
}



voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 c c c |
c8 c c c | 
c8 c c c |
c8 c c4 |
c8 b c4 |
c8 b c4 |
c8 c c b |
c8 c c4 |
}


lyricA = \lyricmode {
Či -- gā -- ni -- ņi, bā -- le -- li -- ņi, kur šo nak -- ti gu -- lē -- sim?
Ka -- la -- do, ka -- la -- do, kur šo nak -- ti gu -- lē -- sim?
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



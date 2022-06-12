\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Sidrabiņa upe tek"
%}
% Skyforger, http://www.youtube.com/watch?v=sNKSQE7l1Ww
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key c \minor
\time 2/4
c8 c c c | g'8 g g g | f4 f8[ aes] | g4. g8 | f8 f f f | ees8 ees ees ees | 
d4 ees8[ d] | c4 c 
\bar "|."
}


lyricA = \lyricmode {
Sid -- ra -- bi -- ņa u -- pe te -- ka u -- pe te -- ka
Vis -- ga -- rā -- mi zel -- ta kal -- nu, zel -- ta kal -- nu. 
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



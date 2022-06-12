\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jāņa daudzinājums (Sit, Jānīti, vara bungas)"
%}
% Katrīna Riekstiņa, #41 (Rasa)
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
\key bes \major
\time 4/4
f8 f ees d c d ees d 
\repeat volta 2 {
f4 f g g | f8 d f f g f ees d 
\time 2/4
f4 d\fermata
}
} 

voiceB = \relative c' {
\clef "treble"
\key bes \major
\time 4/4
s1 
\repeat volta 2 {
f4 f ees ees | d8 bes d d ees d c bes | d4 bes
}
}

lyricA = \lyricmode {
Sit, Jā -- nī -- ti, va -- ra bun -- gas 
lī -- go, lī -- go, 
vār -- tu sta -- ba ga -- li -- ņā -- i, lī -- go.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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




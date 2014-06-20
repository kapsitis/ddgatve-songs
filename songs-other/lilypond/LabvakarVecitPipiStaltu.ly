\version "2.13.16"
%\header {
%    title = "Labvakar, vecīt, pīpi staltu"
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
\partial 8*1
d8 | g8 d c b a g | e'4 d4. d8 |  
e8 c a'8. g16 g4( | fis8) 
\repeat volta 2 { 
d8 e fis g8 a | b( g) d( b) d( c) | a4. d8  e4( | e8) a a( g) g( fis) | g8\fermata
}
} 



lyricA = \lyricmode {
Lab -- va -- kar, ve -- cīt, pī -- pi stal -- tu 
Tu gar -- di kū -- pi -- ni
Ar zel -- ta stī -- pām gre -- zni kal -- tu
Par cik to pār -- do -- si?

}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


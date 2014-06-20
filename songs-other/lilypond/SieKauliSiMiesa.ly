\version "2.13.16"
%\header {
%    title = "Šie kauli, šī miesa"
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
\key ees \major
\time 4/4
\partial 4*1
bes4 | g'2 f4 g | ees2 bes4 g' | bes2 aes4 bes | g2. ees4 
\repeat volta 2 {
c'4 c ees c | bes2 g4 bes | bes4( aes8) g aes4 bes 
}
\alternative { { g2. ees4 } { g2. } } 
} 

lyricA = \lyricmode {
Šie kau -- li, šī mie -- sa, šis gars un šī sirds 
Ir tē -- vu ze -- mes tie -- sa, ka -- mēr šī sau -- le mirdz. 
Ir mirdz 
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



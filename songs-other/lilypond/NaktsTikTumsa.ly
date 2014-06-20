\version "2.13.16"
%\header {
%    title = "Maziņš biju, neredzēju"
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
\key g \minor
\time 3/8
d4 d8 | g4.~ | g4 d8 | c4 bes8 | bes4. | a4. |
d4 ees8 | d4.~ | d4 c8 | bes4 c8 | d4.~ | d4. 
\repeat volta 2 {
d4 d8 | bes'4.~ | bes4 a8 | g4 a8 | g4( ees8) | c4.~ | c4. |
d4 g8 | d4.~ | d4 c8   
}
\alternative { { bes4 c8 | d4. } { bes4 a8 | g4.~ | g4. } }
} 

lyricA = \lyricmode {
Nakts tik tum -- ša me -- ža ma -- lā Tēv' -- jas sar -- gi mie -- gā dus. 
Mel -- nā sag -- šā sie -- va bā -- la klās -- ta nā -- ves pa -- la -- gus, 
pa -- la -- gus.
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



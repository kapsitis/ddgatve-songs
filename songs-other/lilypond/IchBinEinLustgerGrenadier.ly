\version "2.13.16"
%\header {
%    title = "Bin ein lust'ger Grenadier"
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
\time 2/4
\repeat volta 2 {
b'8. a16 g8. e16 | d8 e d4 
}
\alternative { { d8 c' a4 | d,8 b'8 g4 } { d8 c'  a8 fis | g4 r } }
a8 b a b | a8 b a4 | a8 a b cis | d d, d4 
\repeat volta 2 {
d8 d g g | b8 b d4  
}
\alternative { { c8 d, a'4 | b8 d, g4 } { c8 d, a'8 b | g4 r } }
} 

lyricA = \lyricmode {
Ich_bin ein lust' -- ger Gre -- na -- dier, juch -- hei -- di juch -- hei -- da!
_ _ _ _ _
Ich_die -- ne mei -- nem Kö -- nig treu, und_lieb mein Mäd -- chen auch da -- bei!
Juch -- hei -- di, hei -- di hei -- da, juch -- hei -- di juch -- hei -- da, 
juch -- hei -- di hei -- da!
}

lyricB = \lyricmode {
nie -- mals mei -- nen Mut ver -- lier, 
_ _ _ _ _ _
juch -- hei -- di, hei -- da!
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



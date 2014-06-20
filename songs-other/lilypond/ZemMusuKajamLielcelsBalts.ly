\version "2.13.16"
%\header {
%    title = "Zem mūsu kājām lielceļš balts"
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
\key e \minor
\time 4/4
\partial 4*1
\repeat volta 2 {
b' | b4. g8 e4 b' | b4. g8 e4  b'4 | b4 a g fis | e4 r4 r 
}
b4 | e4 fis8 g e4 fis8 g | b4 b r b | c4 c8 c e4 d8 c | b4 r r b4 |
a4 a8 a c4 b8 a | g4 e r g | fis4 fis8 fis a4 g8 fis | e4 r r e |
e'4 e8 e e4 d8 c | e4 b r e, | e'4 e8 e e4 dis8 e | fis4 b,8 b b a g fis |
e4 fis8 g e4 fis8 g | a4 a8 a c4 b8 a | b4 g8 e fis4 g8 fis | e4 r r2
\bar "|."  
}



lyricA = \lyricmode {
Zem mū -- su kā -- jām liel -- ceļš balts, 
uz Lat -- vi -- ju tas ved. 
Mēs so -- ļo -- jam dro -- ši un lep -- ni, 
un šau -- te -- nes ple -- cos ir mums, 
Un se -- na -- jo va -- ro -- ņu vār -- di
nāk lī -- dzi kā man -- to -- jums mums. 
Mēs nāk -- sim drīz, Lat -- vi -- ja, gai -- di,
un ne -- sī -- sim brī -- vī -- bu tev, 
Kas mums dār -- ga, un mēs e -- jam un e -- jam,
un trau -- cam un stei -- dzam, 
par vē -- lu mēs ne -- drīk -- stam būt!
}

lyricB = \lyricmode {
Uz Lat -- vi -- ju, kur naid -- nieks baigs pār lau -- kiem nā -- vi sēj. 
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



\version "2.13.16"
%\header {
%    title = "Teic Dieva Kunga vārdu"
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
\key f \major
\time 4/4
\partial 8*1 
f8 | f8 e d c f( g) a a | a8 a a g f g f\fermata f |
f8 e d c f( g) a a | a a a g f g f\fermata f |
f8 a g a f( e) d d | g8 e f d c4. c8 |
f8 f g g a4 f8 f | bes8 bes a a g4. g8 |
a8 a bes bes c4 f,8 a | g8. e16 f8. d16 c4. c8 |
f8 e d c f( g) a a | bes g a g f4. r8
\bar "|."
} 

lyricA = \lyricmode {
Teic Die -- va, Kun -- ga vār -- du, 
cik va -- ri ma -- na dvē -- se -- līt'.
Cik daudz un da -- žu kār -- tu 
Viņš tev grib la -- bu pa -- da -- rīt.
Viņš ta -- vus grē -- kus pie -- dod, 
kas ta -- vu sir -- di kremt.
Tev ve -- se -- lī -- bu ie -- dod, 
tev' sa -- vā klē -- pī ņem.
Ko lūdz, to dar' ar prie -- ku, 
kā ēr -- gli at -- jau -- no.
To, kas tev dar' pār -- lie -- ku, 
Viņš tais -- ni no -- tie -- sā.
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



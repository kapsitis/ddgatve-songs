\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zvejinieka meita biju",Budēlīši, jūra
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
\key d \major
\time 2/4
fis8. fis16 fis[ e] d8 |
a'8. g16 fis8. d16 |
e8. e16 e[ fis] g8 |
a8. g16 fis4\fermata |
b8. b16 d[ cis] b8 |
b8. a16 a8. d16 |
cis8. b16 a8. g16 |
fis8. g16 fis4\fermata |
\bar "|."
}

lyricA = \lyricmode {
Zve -- ji -- nie -- ka mei -- ta bi -- ju, lai -- vā kā -- pu šū -- po -- ties,
Zve -- ji -- nie -- ka mei -- ta bi -- ju, lai -- vā kā -- pu šū -- po -- ties.
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



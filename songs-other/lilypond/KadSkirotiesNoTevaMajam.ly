\version "2.13.16"
%\header {
%    title = "Kad šķiroties no tēva mājām"
%}
%#(set-global-staff-size 18)
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
\time 9/8
\tempo 4.=60
\partial 8*4
a8 d4 e8 | fis4.~ fis4 d8 g4 g8 
\time 6/8 fis4. d4.~ | d4  fis8 fis4 fis8 \time 9/8 e4.~ e4 e8 g4 fis8 | d4.~ d4 a8 d4 e8 |
fis4.~ fis4 d8 g4 g8 
\time 6/8 fis4. d4.~ | d4  fis8 fis4 fis8 \time 9/8 e4.~ e4 e8 g4 fis8 | d4.~ d4 d8 b'4 b8 |
g4.~ g4 b8 b4 b8 
\time 6/8 a4. fis4.~ | fis4 a8 a4 a8 \time 9/8 g4.~ g4 e8 a4 g8 | fis4.~ fis4 d8 b'4 b8 |
g4.~ g4 b8 d4 b8 
\time 6/8 a4. fis4.~ | fis4 a8 a4 a8 \time 9/8 g4.~ g4 e8 a4 g8 | fis4.~ fis4
\bar "|."
} 

lyricA = \lyricmode {
Kad, šķi -- ro -- ties no tē -- va mā -- jām,
Sirds at -- va -- do -- ties sā -- pes jūt,
Man tā -- lam ce -- ļam jā -- aun kā -- jas,
Lai brī -- vī -- bu var lat -- viet's gūt.
Jel cī -- nies, draugs, lai lat -- vju tau -- ta
Vēl brī -- vīb's sau -- li re -- dzēt var!
Jel cī -- nies, draugs, lai lat -- vju tau -- ta
Vēl brī -- vīb's sau -- li re -- dzēt var!
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




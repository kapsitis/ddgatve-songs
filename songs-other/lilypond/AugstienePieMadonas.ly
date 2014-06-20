\version "2.13.16"
%\header {
%    title = "Augstienē pie Madonas"
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
\key c \major
\time 3/4
g'8. g16 e4 c | a'8. a16 g8[ b] b4 | g8 a b[ d g] f | e8. d16 c4 r |
\repeat volta 2 {
e,8 g c[ e] e4 | e8. e16 f4 f | g8 g g f e e | f8 g e4 r
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 3/4
s2. | a'8. a16 g4 d | g8 a b4. a8 | g8. f16 e4 r    
\repeat volta 2 {
e8 g c4 g | c8. c16 d4 a | c8 c b a g g | a8 b8 g4 r
}
} 


lyricA = \lyricmode {
Aug -- stie -- nē pie Ma -- do -- nas 
stāv no -- mo -- dā viens ka -- ra -- vīrs
Bla -- kus sa -- vam cī -- ņu bied -- ram, 
kurš guļ nā -- vē -- jo -- šas lo -- des ķerts.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


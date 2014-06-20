\version "2.13.16"
%\header {
%    title = "Māte gāja klētī"
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
\time 2/4
a'8 g f a | c( c) c4 | 
a8 f a f | g g g4
bes8 a g bes | d( d) d4 | 
c8 a bes g | f f f4
\bar "|."
} 

lyricA = \lyricmode {
Mā -- te gā -- ja klē -- tī, es tai pa -- kaļ te -- cē -- ju,
mā -- te gā -- ja klē -- tī, es tai pa -- kaļ te -- cē -- ju.
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




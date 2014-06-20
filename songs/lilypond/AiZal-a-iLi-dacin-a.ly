\version "2.13.16"
%\header {
%    title = "Ai, zaļāi līdaciņa, nāc ar mani spēlēties",AA lapas
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
\time 5/8
c8 c c[ d] c |
g8 g g[ c] b |
\time 3/4 
a8 a a8[ c b] a |
g'8 g g8.[ f16 e8] d |
\time 5/8
e8 e e[ f] e |
d8 d d8[ e] d |
\time 3/4 
a8 a a[ c b] a |
g'8 g g4^> r4 |
\bar "|."
} 

lyricA = \lyricmode {
Ai, za -- ļā -- i lī -- da -- ci -- ņa, nāc ar ma -- ni spē -- lē -- tie -- si,
ai, za -- ļā -- i lī -- da -- ci -- ņa, nāc ar ma -- ni spē -- lē -- ties!
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \set midiInstrument = #"recorder"  \oneVoice \autoBeamOff \voiceA }
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



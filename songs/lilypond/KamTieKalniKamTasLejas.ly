\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kam tie kalni, kam tās lejas?"
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


voiceA = {
\clef "treble"
\key g \major
\time 3/4
g'8 b' d''4. d''8 |
e''8 e'' d''4. b'8 |
g'8 b' d''4. d''8 |
e''8 e'' d''4. c''8 |
b'4 c'' d''8 b' |
a'8 a' g'4. a'8 |
b'4 c'' d''8 b' |
a'8 a' g'2  \bar "|."
} 

lyricA = \lyricmode {
Kam tie kal -- ni, kam tās le -- jas,
Kam tie kal -- ni, kam tās le -- jas?
Kam tie lie -- li tī -- ru -- mi -- ņi,
Kam tie lie -- li tī -- ru -- miņ'?
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




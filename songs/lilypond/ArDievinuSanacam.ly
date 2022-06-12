\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ar Dieviņu sanācām"
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


voiceA = \relative c'' {
\clef "treble"
\key a \minor
\time 3/4
a8[ b] c4 c8 d | a4 a a8 e |
e'4 e f8 e | d4 d8[ f] e16[ d] e8 |
a,8[ b] c4 c8 d | a4 a a8 e |
a8[ b] c4 c8 d | a8 g a2~ |
a4\fermata
\bar "|."
} 

lyricA = \lyricmode {
Ar Die -- vi -- ņu sa -- nā -- cā -- mi, 
Ar Die -- vi -- ņu šķī -- rā -- mie -- si, 
Ar Die -- vi -- ņu sa -- nā -- cā -- mi, 
Ar Die -- vi -- ņu šķī -- rā -- mies.
}

voiceB = \relative c'' {
\clef "treble"
\key a \minor
\time 3/4
a8[ b] c4 c8 d |
a4 a a8 e |
c'4 c d8 c |
b4 b8[ d] c16[ b] c8 |
s2. |
a4 a a8 e |
a8[ b] g4 g8 g |
a8 g a2~ |
a4\fermata
}

voiceD = \relative c'' {
\clef "treble"
\key a \minor
\time 3/4
s2. | s2. | s2. |g2. | a2. 
}

lyricD = \lyricmode {
Ē __ Ē __
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Voice = "voiceD" { \voiceFour \autoBeamOff \voiceD }
\new Lyrics \lyricsto "voiceD" \lyricD
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



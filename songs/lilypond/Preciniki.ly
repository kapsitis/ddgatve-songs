\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Precinīki"
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
R2 | e'8 e d d | d8 c b r | a8 a b4 |
R2 | e8 e d d | d8 c b r | a8 a b4 
\bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1." Lobs vo -- kor -- si, mei -- tu muo -- te! Ka -- la -- dō, ka -- la -- dō!
Dū -- si mei -- tu, ma -- lē -- je -- ņu? Ka -- la -- dō, ka -- la -- dō!
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g a b | c8 c b b | b8 a g r | d8 d g4 |
g8 g a b | c8 c b b | b8 a g r | d8 d g4 
\bar "|."
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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



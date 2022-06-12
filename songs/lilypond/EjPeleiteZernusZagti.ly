\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ej, peleite, zērņus zagti"
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


chordsA = \chordmode {
\time 2/4
c2:5 | f4:5 c4:5 | f4:5 c4:5 | g4:5 c4:5 | 
c2:5 | c2:5 | g8:5 c4.:5 |
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 d c c | a'8 a g g | f8 e e4 | f8 f g4 |
g8 g g e | a8 a g g | f8 e e4 
\bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1." Ej, pe -- lei -- te zēr -- ņus zag -- ti, ka -- la -- dō, ka -- la -- dō!
At -- nes ma -- nim pī -- zo -- gu -- se! Ka -- la -- dō!
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 d c c | f8 f e e | d8 c c4 | d8 d e4 |
e8 d c c | f8 f e e | d8 c c4 |
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



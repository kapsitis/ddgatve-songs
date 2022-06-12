\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Vylks un koza"
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
\time 4/8
\oneVoice
g'4^"Palēni" c8 b | 
\time 3/8 c8 g4 | 
\time 4/8 b4 b8 a | 
\time 3/8 g8 b4 |
\time 4/8 g4 c8 b | c4 g8 g | b4 b8 a | 
\time 3/8 g8 b4 \bar "||"
\time 2/4
\voiceOne
g8^"Ātri" g g g | c8 c b b | c8 a g4 | fis8 fis g4 |
\oneVoice
b8 b b b | c8 c  b b | c8 a g4 | d8 d g4 \bar "||"
b8 b b b | c8 c b b | c8 a g4 | d8 d g4 |
b8 b b b | c8 c b b | c8 a g4 | d8 d g4
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 4/8
s2 | 
\time 3/8 s4. | \time 4/8 s2 | \time 3/8 s4. |
\time 4/8 s2 | s2 | s2 | \time 3/8 s4. \bar "||"
\time 2/4
g'8 g g g | a8 a g g | a8 fis e4 | d8 d g4 |
s2 | s2 | s2 | s2 |
s2 | s2 | s2 | s2 |
s2 | s2 | s2 | s2 |
\bar "|."
} 




lyricA = \lyricmode {
\set stanza = #"1." Vylks do -- ra o -- lu nīd -- ro -- jā pū -- rā, 
Ai -- cy -- noj ka -- ze -- ni aļ -- te -- ni dzar -- tu.
\set stanza = #"Piedz." Vylks ar ko -- zu sa -- da -- rā -- ja, ka -- la -- dō, ka -- la -- dō!
Iz de -- ve -- ņom va -- sa -- re -- ņom, ka -- la -- dō, ka -- la -- dō!
Vylks na -- gai -- da tre -- ju dī -- nu, ka -- la -- dō, ka -- la -- dō!
Kreit ko -- za -- i mu -- go -- rā -- i, ka -- la -- dō, ka -- la -- dō!
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



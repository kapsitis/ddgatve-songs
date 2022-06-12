\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Lietiņš līti nemācēja"
%}
% Austras dziesmu burtnīca, 19.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4 d8 e f4 a 
\time 2/4 a8 g a a | g8 g f f 
\time 3/4 e8 f16[ e] d2 
\time 2/4 g8 g f f 
\time 3/4 e8 f16[ e] d2
\bar "|." 
}


lyricA = \lyricmode {
Lie -- tiņš lī -- ti ne -- mā -- cē -- ja, mir -- dzi -- nā -- ti mir -- dzi -- nāj', 
Mir -- dzi -- nā -- ti mir -- dzi -- nāj'.
}


chordsA = \chordmode {
\time 3/4 d2:m f4:5 
\time 2/4 c4:5 f4:5 | c4:5 d4:m 
\time 3/4 a4:m d2:m 
\time 2/4 c4:5 d4:m 
\time 3/4 a4:m d2:m   
}

fullScore = <<
\new ChordNames { \chordsA }
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



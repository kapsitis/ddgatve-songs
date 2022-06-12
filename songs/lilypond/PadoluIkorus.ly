\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Padolu īkorus"
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
\key g \major
\time 3/8
g'8 c b | c8 g g | g8 c b | a8 b4 | 
g8 c b | a8 g g | g8 c b | a8 g4 
\bar "|."
} 

lyricA = \lyricmode {
\set stanza = #"1." Pa -- do -- lu ī -- ko -- rus, kab na -- da -- lēj -- se, 
Pa -- do -- lu ī -- ko -- rus, kab na -- da -- lēj -- se. 
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




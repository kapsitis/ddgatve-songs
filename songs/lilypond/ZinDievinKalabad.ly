\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zin, Dieviņ, kālabad"
%}
% Budēlīši, p.106
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
\time 2/4 g'8 d g g | d8 d b b | g'8 g b b | a a b8. a16 |
g16[ fis] e8 g g | d8 d b b | g' fis e e | b b e4    
\bar "|." 
} 

lyricA = \lyricmode {
Zin, Die -- vi -- ņi, kā -- la -- ba -- di es ne -- va -- ru līk -- sma bū -- ti; 
Zin, Die -- vi -- ņi, kā -- la -- ba -- di es ne -- va -- ru līk -- sma būt.
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



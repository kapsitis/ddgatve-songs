\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Saule brauca pār debesi
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
\time 6/8
g'8 g4 c8 bes4 | c8 c4 bes8 g4 | c8 bes4 bes8 c4 | c8 bes4 g4. |
g8 g4 c8 b!4 | c8 c4 b8 g4 | c8 b4 b8 c4 | c8 b4 g4. |
\bar "|."
} 

lyricA = \lyricmode {
Sau -- le brau -- ca pār de -- be -- si
Div' dzel -- te -- ni ku -- me -- liņ', 
Sau -- le brau -- ca pār de -- be -- si
Div' dzel -- te -- ni ku -- me -- liņ'. 
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



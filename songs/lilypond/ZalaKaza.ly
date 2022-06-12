\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zaļa kaza"
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


voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 4/4
\repeat volta 2 {
g8 d d d a d d d | a8 d d d a d d d
} 
g8 g g8. g16 g8 g g8. g16 | g8 g g8. g16 g8 d d4
d8 d d8. d16 d8 d d4 | d8 d d8. d16 d8 d d4
\bar "|."
} 

lyricA = \lyricmode {
Za -- ļa ka -- za, va -- ra ra -- gi, vi -- sas čet -- ras kā -- jas kal -- tas.
To būs jā -- ti pui -- sē -- nie -- mi ik -- svēt -- die -- nas baz -- nī -- cā.
To būs jā -- ti pui -- sē -- niem ik -- svēt -- die -- nas baz -- nī -- cā.
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




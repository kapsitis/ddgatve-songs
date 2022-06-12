\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pērkonītis"
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


voiceA = \transpose a c' { \relative c'' {
\clef treble
\key a \major 
\time 2/4
\override Score.BarNumber 
#'break-visibility = #end-of-line-invisible
\break  
\repeat volta 2 {
a8 a cis8. cis16 | a8 a a8. a16 | 
gis8 e e8. e16 | a8 a a4 \break
}
\repeat volta 2 {
b8 b b8. b16 | e8 gis, gis8. gis16 | 
a8 fis fis8. dis16 | e8 e e4 
}
} }

voiceB = \transpose a c' { \relative c'' {
\clef treble
\key a \major 
\time 2/4
\repeat volta 2 {
s2*4
}
\repeat volta 2 {
gis8 gis gis8. gis16 | b8 e, e8. e16 | 
fis8 dis dis8. b16 | gis8 gis gis4 
}
} }

lyricA = \lyricmode {
Pēr -- ko -- nī -- tis du -- ci -- nā -- ja, vi -- su cau -- ru va -- sa -- riņ'.
Lai rīb tau -- tu is -- ta -- bi -- ņa je -- le šā -- du va -- ka -- riņ.
}

chordsA = \chordmode {
\time 2/4
\repeat volta 2 {
c2:5 | c2:5 | g2:5 | c2:5 | 
}
\repeat volta 2 {
g2:5 | g2:5 | c2:5 | g2:5 |
}
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



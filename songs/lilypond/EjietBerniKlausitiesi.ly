\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ejiet, bērni, klausītiesi"
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
\repeat volta 2 {
c2:5 | c4:5 g4:5 | g2:5 | g4:5 c4:5 |   
}
}


voiceA = \relative c'' { 
\clef "treble"
\key c\major
\time 2/4
\repeat volta 2 {        
g8 e g e | a g g g | g f f f | f e e4
}
} 


lyricA = \lyricmode {
E -- jiet bēr -- ni  klau -- sī -- tie -- si, 
kas pa na -- mu rī -- bi -- nāj'. 
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



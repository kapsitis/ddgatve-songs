\version "2.13.16"
%\header {
%    title = "Maziņš biju, neredzēju"
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
\key f \major
\time 2/4
\repeat volta 2 {
a'8 g f d | c8 d c4 | c8 a' g e | f4 r4  
}
g8 g g g | g8 g g4 | g4 g | g8 g g4 | 
c8 c c8. bes16 | a8 f f f | f8 a c4 | a8 g f4
\bar "|."
} 

lyricA = \lyricmode {
Ma -- ziņš bi -- ju, ne -- re -- dzēj', jo -- hai -- di um dā, 
Don -- ner ve -- ter ro -- ta pļi, Šauj, krauj, pa -- kaļ spļauj, 
No -- šauj ma -- zu vā -- ve -- rī -- ti, 
Jo -- hai -- di, jo -- hai -- dā.
}

lyricB = \lyricmode {
Kad no -- mi -- ra tēvs, mā -- miņ', jo -- hai -- di -- um dā!
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



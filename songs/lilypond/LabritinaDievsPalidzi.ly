\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labrītīna, Dievs palīdzi"
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
\time 2/4
\repeat volta 2 {
a'8 a b8. a16 | a8. g16 g8 fis | a8 g g fis | b8 a g4
}
} 

lyricA = \lyricmode {
\set stanza = #"1." Lab -- rī -- tī -- na, Dievs pa -- lī -- dzi, tā pir -- mā -- ja va -- lo -- dīn'.
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




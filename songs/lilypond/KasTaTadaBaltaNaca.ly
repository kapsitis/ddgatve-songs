\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tā tāda balta nāca?"
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
\time 4/4
d'4 d c b8[ a] | b8[ c] d4 a a |
d4 d c b8[ a] | b8[ c] d4 a a 
\time 2/4
b8 g g g | fis8 a a a |
b8 g g g 
\time 4/4
d4 fis g2
\bar "|."
} 

lyricA = \lyricmode {
Kas tā tā -- da bal -- ta nā -- ca, 
Kas tā tā -- da bal -- ta nā -- ca
Bez sau -- lī -- tes va -- ka -- rā -- i, 
Bez sau -- lī -- tes va -- ka -- rā?
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




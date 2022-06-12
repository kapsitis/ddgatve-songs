\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Dieviņš kāpa kumeļā"
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


voiceA = \relative c'' {
\clef "treble"
\key g \minor
\time 3/4
g4. bes16[ a] g8 bes
\time 2/4
a8 a a g16[ a] |
bes8 bes bes a16[ bes] |
c8 a a a |
g4 g8 f16 g |
a8 a a4 |
bes4 g |
a2
\bar "|."
} 

lyricA = \lyricmode {
Die -- viņš kā -- pa ku -- me -- ļā -- i, Es kāp -- sli -- ņus
pa -- tu -- rē -- ju, Rā -- ri ri -- di ral -- lal -- lā, Rā -- lā -- lā. 
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



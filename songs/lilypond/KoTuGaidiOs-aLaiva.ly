\version "2.13.16"
%\header {
%    title = "Ko tu gaidi oša laiva,mana brāla valgumāi, airai ridi",Budēlīši, jūra
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
\time 3/4
c'8 c c4. a8 |
c8 a f4. a8 |
bes8 a g4. e8 |
f16[ e] d8 c4. c8 |
f8 f f4. a8 |
bes a g4. a8 |
bes8 d c4. bes8 |
a8 g f2 |
\bar "|."
}

lyricA = \lyricmode {
Ko tu gai -- di o -- ša lai -- va, ma -- na brā -- ļa val -- gu -- mā -- i, ai -- rai ri -- di,
ai -- rai ri -- di, ma -- na brā -- ļa val -- gu -- mā!
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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



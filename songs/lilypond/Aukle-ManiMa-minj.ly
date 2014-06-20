\version "2.13.16"
%\header {
%    title = "Auklē, mani, māmiņ",AA lapas, Šūpuļdziesmas
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
\time 2/4
c8 b a f' |
e4 d8[ b] |
c8 b a f'|
e4 d |
f8 d e e |
d4 a8[ b] |
c8 c d b |
a4 a |
\bar "|."
} 

lyricA = \lyricmode {
Au -- klē, ma -- ni, mā -- miņ, dai -- ļu ka -- ra -- vī -- ru; au -- klē, ma -- ni, mā -- miņ, dai -- ļu ka -- ra -- vī -- ru.
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



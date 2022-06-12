\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jūrā gāju naudu sēti", Websense grāmata
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
g'8. c,16 c8 c | d8 d d d | e8 e e g | a8 g a b | 
c8. a16 b8 b | a8 a e e | g8 g g g | g8 g g g |  
\bar "|."
} 

lyricA = \lyricmode {
Jū -- rā gā -- ju nau -- du sē -- ti, 
Sau -- jā ne -- su dvē -- se -- lī -- ti, 
Jū -- rā gā -- ju nau -- du sē -- ti, 
Sau -- jā ne -- su dvē -- se -- lī -- ti.
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



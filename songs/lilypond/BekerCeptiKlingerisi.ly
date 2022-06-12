\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Beķer' cepti kliņģerīši"
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

voiceA = {
\clef "treble"
\key g \major
\time 2/4
b'8 d' d' d' | g'8 fis' g' a' |
b'8 d' d' d' | g'8 fis' g' a' |
b'8 b' c''8. b'16 | b'8 a' a'4 |
a'8 a' b'8. a'16 | a'8 g' g'4  
\bar "|."
} 

lyricA = \lyricmode {
Be -- ķer' cep -- ti kliņ -- ģe -- rī -- ši,
be -- ķer' cep -- ti kliņ -- ģe -- rī -- ši,
go -- vu piens un me -- du -- tiņš,
go -- vu piens un me -- du -- tiņš.
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



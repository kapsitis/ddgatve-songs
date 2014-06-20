\version "2.13.16"
%\header {
%    title = "Ko tu raudi, tēvs, māmiņa?"
%}
% Budēlīši, p.102
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
\key aes \major
\time 3/4 c'8 bes aes4 aes 
\time 4/4 aes4( g8) aes c4 bes\fermata
\time 3/4 des8 c bes4 bes 
\time 4/4 bes4( aes8) bes c2 
\time 3/4 aes8 c ees4 ees 
\time 4/4 des4 c bes ees,\fermata
\time 3/4 des'8 bes c4 c 
\time 4/4 bes4( c8) bes aes2
\bar "|." 
} 

lyricA = \lyricmode {
Ko tu rau -- di, tēvs, mā -- mi -- ņa? Nu tu e -- si at -- de -- vus'.
Ko tu rau -- di, tēvs, mā -- mi -- ņa? Nu tu e -- si at -- de -- vus'.
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



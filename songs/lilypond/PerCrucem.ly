\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% kanon zu 6 stimmen
% Per Crucem
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 4/4
d2 d( | c2) f4. f8 | f4 f e d | e2 d\fermata |
d8 f a d bes a g4 | c,8 e g c a g f4 | bes,8 d f bes g f e4 | a4 e f2\fermata |
a2 bes( | c2) a4. a8 | bes4 f g g | a4( cis,) d2\fermata |
d'8 c bes a g a bes4 | c8 bes a g f g a4 | bes8 a g f e f g4 | a4 a d,2\fermata |
d'2 d( | e2) c | d8 c bes a bes4 bes | a2 a\fermata | 
d,8 d d d g g g4 | c,8 c c c f f f4 | bes,8 bes bes bes e e e4 | a,4 a d2\fermata |
\bar "|."
}



lyricA = \lyricmode {
Per cru -- cem et pas -- si -- o -- nem tu -- am li -- be -- ra nos Do -- mi -- ne, li -- be -- ra nos Do -- mi -- ne,
li -- be -- ra nos Do -- mi -- ne, Do -- mi -- ne.
per cru -- cem et pas -- si -- o -- nem tu -- am li -- be -- ra nos Do -- mi -- ne, li -- be -- ra nos Do -- mi -- ne,
li -- be -- ra nos Do -- mi -- ne, Do -- mi -- ne.
per sanc -- tam re -- su -- rec -- ti -- o -- nem tu -- am li -- be -- ra nos Do -- mi -- ne, li -- be -- ra nos Do -- mi -- ne,
li -- be -- ra nos Do -- mi -- ne, Do -- mi -- ne.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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



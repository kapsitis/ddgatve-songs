\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AA-Lapas, Lieldienas 
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/8 
g'8 g e e|
\time 6/8 
f16[ e] g8.[ e16] f8 e4
\time 4/8 
g8 e f e
\time 6/8 
f16[ e] g8.[ e16] f8 e4|
f16[ e] g8.[ e16] f8 e4|
f16[ e] g8.[ e16] f8 e4|
\time 4/8 
g8 g e e|
\time 6/8 
f16[ e] g8.[ e16] f8 e4
\bar "|."
}

lyricA = \lyricmode {
Kū as de -- vu šyu -- pe -- ļa -- me, kū šyu -- pe -- ļa kuo -- rie -- ja -- me?
Kū as de -- vu šyu -- pe -- ļa -- me, kū šyu -- pe -- ļa kuo -- rie -- ja -- me?
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/8 
e8 c c d16[ e]
\time 6/8 
f16[ d] e8[ c] d c8.[ d16] 
\time 4/8 
e8 f16[ d] c[ d] e8
\time 6/8 
f16[ d] e8[ c] d c4
d16[^\markup { \italic "dominē apakšējā balss" } c] c[ d e c] d8 c4
d16[ c] c[ d e c] d8 c4
\time 4/8 
e8 e e e
\time 6/8 
f16[ d] e8[ c] d c4
}

fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
>>
}
>>
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



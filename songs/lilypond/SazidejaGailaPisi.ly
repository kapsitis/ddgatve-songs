\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sazīdēja gaiļa pīši"
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
\key g \major
\time 2/4
\repeat volta 2 {
b8 a g e | d8 g g g | fis8 a a a | b8 a g4
}
b8 b b4 | c8 c c4 | a8 a a c | b8 b b4 |
g8 g g4 | a8 a a4 | fis8 d b' a | g8 g g4
\bar "|."
} 



lyricAA = \lyricmode {
Sa -- zī -- dē -- ja gai -- ļa pī -- ši
A -- pei -- nei -- ša ga -- le -- ņā.
Ma -- le -- ņā, ma -- le -- ņā,
Le -- la ce -- ļa ma -- le -- ņā.
Ma -- le -- ņā, ma -- le -- ņā,
Le -- la ce -- ļa ma -- le -- ņā.
}


lyricAB = \lyricmode {
Dze -- rit kuo -- zys, lat -- ga -- lī -- ši,
Le -- la ce -- ļa ma -- le -- ņā!
_ _ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ _ _ _
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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



\version "2.13.16"
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
\key bes \major
\time 4/4 \tempo 4=100
r4 f f ees | d2. f4 |
bes4. a8 g4 d | f2 ees |
r4 ees ees d | c2. f4 |
f4. f8 g4 f | d2. r4 |
\repeat volta 2 {
r4 f4 d f | bes4. d8 d4 <<d f,>> |
<<c'4 ees,>> <<bes' d,>> <<a' c,>> <<bes' d,>> |
<<ees'2 g,>> <<ees' g,>> |
r4 c c bes | <<d2. f,>> bes4 | a4. a8 g4 a |
bes2. r4
}
} 

lyricA = \lyricmode {
Die Fah -- ne hoch! Die Reih -- en fest ge -- schloss -- en!
S. A. mar -- schiert mit ruh -- ig fes -- tem Schritt.
Kam' -- ra -- den, die Rot -- front und Re -- ak -- tion er -- schoss -- en,
Mar -- schier'n im Geist in un -- sern Rei -- hen mit.
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



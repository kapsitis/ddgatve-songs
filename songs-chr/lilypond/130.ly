\version "2.13.18"

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

chordsA = \chordmode {
f1 a2:min7 d:7 g1:min c2:sus4 c f g:min f c f bes4 c f1
}

voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4

c4 f8 g a4 g8 f | e2 d4 r | d g8 a bes4 a8 g | f2 e8 r a bes | c4 c8 c bes4 bes8 bes | a4 a g8 r a bes | c4 f,8 g a g f e | f2. r4 \bar"|."
}

lyricA = \lyricmode {
Die -- va Gars pie -- pil -- da sir -- di, Die -- va Gars pie -- pil -- da sir -- di. Lai Viņš dzī -- vo tur vien -- mēr un spē -- ku dod, vi -- sus mūs lai tas šo -- dien ap -- vie -- no.
}


fullScore = <<
\new ChordNames { \chordsA }
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



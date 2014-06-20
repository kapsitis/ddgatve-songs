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
d1 a b:min fis:min g d e:min7 a:7
d a b:min fis:min g d a:7 d
}

voiceA = \relative c'{
\clef "treble"
\key d \major
\time 4/4

fis4 a2. | e4 a2. | d,4 fis2. | cis4 fis2. | b,4 d2. | a4 d2. | fis2. g4 | e1 |
fis4 a2. | e4 a2. | d,4 fis2. | cis4 fis2. | b,4 d2. | a4 d2. | cis4 d e2 | d1 \bar"|." 

}

lyricA = \lyricmode {
Jē -- zu, dod mums pa -- zīt Te -- vi. Ļauj mums re -- dzēt de -- be -- sis.
Va -- di, mā -- ci, sar -- gi, svē -- tī, at -- ļauj vien -- mēr pie Te -- vis būt.
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
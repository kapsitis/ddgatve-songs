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

chordsA = \chordmode {c2. e:min g a:min e:min d4.:min g:7 c2. s1. f2. c d:min g4. c f2. c d:7 g g:7}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 6/8

c4.~ c8 e f | g4. g | d~ d8 e f | e4. c | g'~ g8 f e | d4.~ d8 c d | e2. \bar"||" c2.~ | c \bar"||" a'4.~ a8 b a | g4.~ g8 f e | f4.~ f8 g a | g4. g | a a | g~ g8 g g | fis4.~ fis8 e fis | g2.~ | g \bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1. "
Jau -- na -- va šķīs -- tā, Mā -- te tik  mai -- gā, Ma -- rij, es dzie -- dā -- šu Tev. _ Ma -- rij, caur Te -- vi es e -- ju pie Jē -- zus, ma -- na lūg -- ša -- na caur Te -- vi plūst.
}
lyricB = \lyricmode {
\set stanza = #"2. "
Lī -- dzī -- gi bēr -- nam, pilns pa -- ļā -- vī -- bas, Ma -- rij, es dzie -- dā -- šu _ Tev.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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


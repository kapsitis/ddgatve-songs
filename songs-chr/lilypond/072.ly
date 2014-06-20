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
f2. c1. f1. g:7 c2 c4:7 f2. bes2 c1 a2:min d1:min g2.:min c f
}

voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 3/4

a4 a a | a4. g8 g4 | g a bes | a2. | c4 c c | c4. b8 b4 | b c d | c2 (bes4) |
a4 bes c | d4. g,8 g4 | g a bes | c4. f,8 f4 | f g a | bes4. d,8 d4 | e f g | f2.
 
}

lyricA = \lyricmode {
\set stanza = #"1. "
Mā -- ci man ti -- cēt, Kungs, mā -- ci man lūgt! Bēr -- niš -- ķi ti -- cēt un bēr -- niš -- ķi lūgt! Vai die -- nas sau -- lai -- nas, vai dzī -- vē prie -- ka maz, sirds lai Tev uz -- ti -- cas. Mā -- ci man lūgt!
}
lyricB = \lyricmode {
\set stanza = #"2. "
Mā -- ci man ti -- cēt, Kungs, mā -- ci man lūgt! Dzī -- vot kā vē -- lies Tu: mā -- ci man lūgt! Dod gais -- mu tum -- sī -- bā, ved ce -- ļā pa -- rei -- zā, sniedz ro -- ku pa -- lī -- gā. Mā -- ci man lūgt!
}
lyricC = \lyricmode {
\set stanza = #"3. "
Mā -- ci man ti -- cēt, Kungs, mā -- ci man lūgt! Bēr -- niš -- ķi ti -- cēt un bēr -- niš -- ķi lūgt! Kā bērns Tev pie -- glau -- žos un dro -- ši pa -- ļau -- jos, Tev vie -- nam uz -- ti -- cos. Mā -- ci man lūgt!
}


fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



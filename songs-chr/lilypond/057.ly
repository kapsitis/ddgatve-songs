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
chordsA = \chordmode {f1~ f1 d:min a:min b2 c f1 b2 a d1 b4 c4 f2}
voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4

f2 g4 a | a4. a8 a2 | f2 g4 a | a4. a8 a2 | f8. f16 f8. f16 a8. g16 f8. g16 | a8 a16 a4 a16 c2 | \times 2/3{d8 [c bes]} a g \times 2/3 {d' [bes a]} g4 | f2. r4 | \times 2/3 {bes8 [a g]} a4 f r \bar "|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tu e -- si brī -- niš -- ķa, Tu e -- si brī -- niš -- ķa, pa -- tī -- ka -- ma sa -- vā  pie -- mī -- lī - - bā, _ svē__-__tā Die -- va Dzem__-__dē -- tā -- ja, Dzem-dē -- tā -- ja.
}
lyricB = \lyricmode {
\set stanza = "2. "
Spe - ci -- o - sa, spe - ci -- o - sa, pac -- ta es et sua -- vis in de -- li -- ci -- is tu -- is san__-__cta De -- i, Ge -- ni -- trix, Ge -- ni -- trix.
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


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
f1 f bes f g:min f c f
f1 f bes f g:min f c f
}

voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4

f2 c4 a' | f1 | bes2 f4 g | a1 | bes2 c4 bes | a2 (f) | g e4 g | f1 \bar"||" \break
f4 f8 f f f a g | f2 f | bes4 bes8 bes bes bes f g | a2 a |
bes4 bes8 bes bes bes c bes | a4. g8 f2 | g4 e8 e e e g g | f1 \bar"|."
}

lyricA = \lyricmode {
Al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja!
\set stanza = "1. "
Dzie -- dā -- sim Kun -- gam vi -- sa ze -- me! Prie -- kā _ teik -- sim Vi -- ņa vār -- du.
Nāk -- sim pie Vi -- ņa sla -- vas dzies - mām, tā -- pēc ka Kungs mūs vi -- sus mīl.
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
\set stanza = "2. "
Ie -- sim pie Vi -- ņa pa -- tei -- cī -- bā! Dzie -- dā -- sim him -- nas Vi -- ņa na -- mā.
Kal -- po -- sim Vi -- ņam svēt -- lai -- mī - bā, tā -- pēc ka Kungs mūs vi -- sus mīl.
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
\set stanza = "3. "
Dzie -- dā -- sim Kun -- gam vi -- sa ze -- me! Viņš ir _ mū -- su Kungs un Dievs. _
Mēs Vi -- ņa a -- vis, Viņš ir la -- bais Gans, tā -- pēc ka Kungs mūs vi -- sus mīl.
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



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
c1 f g2:sus4 g:7 c1 c f g2:sus4 g:7 c1 a:min d:min g2:sus4 g:7 c1 a:min d:min f2 g c1
}

voiceA = \relative c''{
\clef "treble"
\key c \major
\time 4/4

g4. (e8) e4 c | a'4. (f8) f4 c' | c2 b4. a8 | a (g) g2 r4 | g4. e8 e4 c | a'4. f8 f4 f | c'2 b4. c8 | c2. r4 |
c4. (e,8) e2 | d4 (e) f r | c'2 b | a8 (g) g2 r4 | c4. (e,8) e2 | d4 (e) f r | c'2 b4. c8 | c1 \bar"|."
}

lyricA = \lyricmode {
Jē -- zu, Tu la -- bais, es pie -- lū -- dzu Te -- vi. Sa -- vu gal -- vu Ta -- vā priek -- šā es no -- lie -- cu.
Al -- le -- lu -- ja, al -- le -- lu -- ja! Al -- le -- lu -- ja, al -- le -- lu -- ja!
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
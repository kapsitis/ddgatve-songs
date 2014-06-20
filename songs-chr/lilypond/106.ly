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
s4 f2. d:min g:min c f d:min g2 c4 d2. f d:min bes c f d:min bes c:7
}

voiceA = \relative c'{
\clef "treble"
\key f \major
\time 3/4
\partial 4

c8 c |
\repeat volta 2 {
f4 f g8 a | f4 f g8 a | bes4 bes a | g8 (f e4) c8 c | 
f4 f g8 a | f4 f g8 a | bes4 c a8 g | f2.^\markup { \translate #'(4 . 0) \italic Fine} \bar"||" \break
c'4 c a | d2 c4 | bes2 a8 bes | g2. | a4 g f | f g a | \stemUp bes2 (a8 bes) \stemNeutral | g2 c,8 c}
}

lyricA = \lyricmode {
Al -- le -- lu -- ja, al -- le -- lu -- ja Jē -- zus ir mū -- su Kungs! Al -- le -- lu -- ja, Al -- le -- lu -- ja. Lai top sla -- vēts Vi -- ņa vārds.
Jē -- zus ir vi -- sas pa -- sau -- les Kungs. Jē -- zus ir ra -- dī -- bas Ķē -- niņš. Al -- le-
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
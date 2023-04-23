\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 1.6\cm
between-system-space = 1.6\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key c \major
%\mark "Sauceja."
\time 2/4
g'8^"Sauceja."_"Vilcejas." d d\tenuto d | g d d\tenuto d | g4 e4\fermata |
e4 e | e8^"Locitajas." e e e | e d d d | g4 e( | e\fermata)( d8) r8
\bar "|."
}

lyricAA = \lyricmode {
Ja -- ņam ru -- dzi, Ja -- ņam mee -- z̧i li -- go! li -- go!
Ja -- ņam sir -- mi ku -- me -- li -- ņi li -- go!
}

lyricAB = \lyricmode {
Deevs dod ma -- nim lee -- lai augt -- ti li -- go! li -- go!
Bu -- şu Ja -- ņa li -- ga -- vi -- ņa li -- go!
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | r4 e4( | e2)( <>) | e2(  <>) | e2(  <>) | e2(   | e4)( d8) r8
}

lyricB = \lyricmode {
eh! __
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricB
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
>>
}
>>

\score {
\fullScore
\header { piece = "__" opus = "Kurzemé, Varenbroká, Slikşanu majas saime dzeed." }
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

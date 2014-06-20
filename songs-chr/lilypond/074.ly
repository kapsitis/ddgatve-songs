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
s4 a1:5 e1:5 e1:5 a2. a4:7 d1:5 a1 e1:7 a2.:5
}

voiceA = \relative c'{
\clef "treble"
\key a \major
\time 4/4
\partial 4

cis8 d | e4 e r fis8 e | e4 b r e8 e | gis4. fis8 e4 d | cis8 e e2
\repeat volta 2 { a8 a | a4 fis2 a8 a | a4 e2. | e2 gis4 b |a2.}
}

lyricA = \lyricmode {
\set stanza = "1. "
Kris -- tie -- ši mēs vi -- si e -- sam, Dievs mūs va -- da cau -- ri dzī - vei, kris -- tie -- ši mēs vi -- si e -- sam. Al -- le -- lu -- ja!
}
lyricB = \lyricmode {
\set stanza = "2. "
Die -- va bēr -- ni vi -- si e -- sam, Dievs mūs va -- da cau -- ri dzī - vei, Die -- va bēr -- ni vi -- si e -- sam. Al -- le -- lu -- ja!
}
lyricC = \lyricmode {
\set stanza = "3. "
Svēt -- ceļ -- nie -- ki vi -- si e -- sam, Dievs mūs va -- da cau -- ri dzī - vei, svēt -- ceļ -- nie -- ki vi -- si e -- sam. Al -- le -- lu -- ja!
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
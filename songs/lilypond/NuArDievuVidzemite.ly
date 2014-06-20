\version "2.13.16"
%\header {
% title = "Nu ar Dievu Vidzemīte"
%}
#(set-global-staff-size 16)
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


voiceA = \relative c'' {
\tempo 4 = 120
\clef "treble"
\key a \major
\time 4/4
a4. a8 a4 a |
e4. e8 e4 gis |
a4 a a cis |
d4. d8 d2 |
cis4 cis cis cis |
b4. b8 b4 b |
e4 d cis4. b8 |
a4 gis a2
\bar "|."
}


voiceB = \relative c'' {
\clef "treble"
\key a \major
\time 4/4
r4 <cis, e> r <cis dis> |
r4 <b d> r <b d> |
r4 <a cis> r <e' a> |
r4 <d fis a> r <b e gis> |
r4 <cis e a> r <cis a'> |
r4 <fis a> r <e gis> |
r4 <e gis> <e a> <d fis> |
r4 <b d> r <a cis>
}

voiceC = \relative c {
\clef "bass"
\key a \major
\time 4/4
a'2 fis |
gis2 e |
fis2 cis |
b2 e |
a,4 a' fis e |
dis2 d |
cis4 <b e> a d |
e2 <a, e'>2
\bar "|."
}

lyricAA = \lyricmode {
Nu ar Die -- vu, Vi -- dze -- mī -- te, ne -- bū -- šu vairs Vi -- dze -- mē. 
Ne -- ie -- šu vairs sa -- vā va -- ļā cie -- ma dur -- vis vi -- ri -- nāt.
}

lyricAB = \lyricmode {
Teu -- res Liv -- land Gott be -- foh -- len, in die Frem -- de geht's hin -- aus!
Kann nicht mehr als frei -- er Bur -- sche nach -- bar -- lich von Haus zu Haus.
}


fullScore = <<
\new Voice = "voiceA" { \set midiInstrument = #"trumpet" \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB

\new PianoStaff 
<<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \set midiInstrument = #"acoustic grand" \voiceOne \voiceA }
\new Voice = "voiceB" { \set midiInstrument = #"acoustic grand" \voiceTwo \voiceB }
>>}
\new Staff = "lower" {<<
\new Voice = "voiceC" { \set midiInstrument = #"acoustic grand" \oneVoice \voiceC }
>>}
>>
>>

\score {
\fullScore
\header { piece = "__" opus = "__" }
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



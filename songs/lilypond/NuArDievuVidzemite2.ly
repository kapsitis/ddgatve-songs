\version "2.13.16"
%\header {
% title = "Nu ar Dievu Vidzemīte"
%}
% J.Vītola t.dz. ar klavieru pavadījumu
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \major
\time 4/4
a'4. a8 a4 a |
e4. e8 e4 gis |
a4 a a cis |
d4. d8 d2 |
cis4 cis cis cis |
b4. b8 b4 b |
e4 d cis4. b8 |
a4 gis a2
\bar "|."
}



lyricAA = \lyricmode {
\set stanza = #"1. "
Nu ar Die -- vu, Vi -- dze -- mī -- te, ne -- bū -- šu vairs Vi -- dze -- mē. 
Ne -- ie -- šu vairs sa -- vā va -- ļā cie -- ma dur -- vis vi -- ri -- nāt.
}

lyricAB = \lyricmode {
\override StanzaNumber #'font-shape = #'italic
\set stanza = #"1. "
\override LyricText #'font-shape = #'italic
Teu -- res Liv -- land Gott be -- foh -- len, in die Frem -- de geht's hin -- aus!
Kann nicht mehr als frei -- er Bur -- sche nach -- bar -- lich von Haus zu Haus.
}


chordsA = \chordmode {
a1:5 | e1:7 | fis2.:m a4:5 | b1:m7 |
a1:5 | b2.:7 e4:5 | a2.:5 b4:m | a4:5 e4:7 a2:5 
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
>>
}
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



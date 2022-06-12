\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Agri lēca saulīte Lieldienas rītā",AA lapas, Liela diena
%}
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 e e f |g4 e8 e |g4 e8 f |e4 e |
e4 e8 f |g4 e8 e |g4 e8 f |e4 e8 e |
e8 e e f |g8 f e e |g8 f e f |e8 e e4 |
e8 e e f |g8 f e4 |g8 f e f |e8 e e4 |
e4 e8 f |g4 e |g4 e8 f |e4 e |
e4 e8 f |g4 e8 e |g4 e8 f |e4 e |
e8 e e( f) |g4 e8 e |g4 e8 f |e4 e |
e8 e e f |g4 e8 e |g4 e |e2 |
e4 e8 f |g4 e8 e |g4 e |e2 |
e4 e8( f) |g4 e8 f |g4 e4 |e4 e |
e8 e e f |g8 f e e |g8 f e f |e8 e e4 |
e8 e e f |g8 f e4 |g8 f e f |e8 e e4 |
e4 e8 f |g4 e8 e |g8( f) e f |e4 e8 e |
e8 e e( f) |g4 e |g4 e8 f |e4 e8 e |
e4 e8 f |g4 e8 e |g4 e8 f |e4 e8 e |
e4 e8 f |g4 e |g4 e8 f |e4 e |
% e4 e8 f |g4 e |g4 e8 f |e4 e |
e8 e e f |g8 f e4 |g8 f e f |e8 e e4 |
e8 e e f |g8 f e e |g8 f e f |e8 e e4 |
\bar "|."
} 

lyricA = \lyricmode {
Ag -- ri lē -- ca Sau -- lī -- te Liel -- die -- nas rī -- tā,
pats Die -- viņš stai -- gā -- ja pa za -- ļu zā -- lī -- ti.
Vi -- su nak -- ti ne -- gu -- lē -- ju, Mā -- ras rī -- tu gai -- dī -- dam', 
lai lā -- cī -- tis cel -- da -- mies sa -- vu mie -- gu ne -- at -- dev'.
Liel -- die -- nas rī -- tā sar -- ka -- na Sau -- le,
Mār -- ši -- ņas vil -- lai -- nei sar -- ka -- nas bārk -- stis.
Za -- ļa zied zā -- lī -- te Liel -- die -- nas rī -- tā, 
bal -- ta gā -- ja Mā -- ri -- ņa baz -- nī -- cā.
Ko gā -- ji, Mā -- ri -- ņa, baz -- nī -- cā? 
Gā -- ju bēr -- ni -- ņu ap -- lū -- ko -- ti.
Zel -- ta pu -- ķe mī -- ļā Mā -- re no -- slau -- cī -- ja la -- ka -- tos,
no -- slau -- cī -- ja la -- ka -- tos, ie -- tin zī -- da pa -- la -- gos.
Kuš -- ki -- na, la -- li -- na Mā -- ri -- ņa bēr -- ni -- ņu,
zel -- ta kalts šū -- puls sid -- ra -- ba līk -- sti -- ņa.
Liel -- die -- na vai -- cā -- ja, kur kār -- t(i) šū -- pu -- li?
A -- vo -- ta kal -- nā, sid -- ra -- ba līk -- stī.
Lie -- las die -- nas rī -- ti -- ņā ag -- ri gā -- ju šū -- po -- ties,
lai re -- dzē -- ju ko -- ku ga -- lus zel -- ta sau -- li mar -- go -- jam.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



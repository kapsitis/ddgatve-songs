\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Lieldienas
% Nāc nākdama, Liela diena, Vārnavas godu balss
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
d8 d e e | f8 d d\( d\) | f8 f f f | f8 e d4 | f8 f f f | f8 e d4 | f8 f f f | f8 e d4 | f8 f f f | f4 e\fermata | d4 \oneVoice r4
\bar"|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s2 | c8 c c c | c8 c d4 | c8 c c c | c8 c d4 | c8 c c c | d4 c\fermata | d4 s4
}

voiceC = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s4 d4~ | d2\( | d2\)~ | d2~ | d2~ | d2~ | d2~ | d4 \oneVoice r4
\bar "|."
}

lyricA = \lyricmode {
Nāc nāk -- da -- ma, Lie -- la die -- na, vi -- si bēr -- ni te -- vi gaid'. 
Nāc nāk -- da -- ma, Lie -- la dien, vi -- si bēr -- ni te -- vi gaid', vi -- si bēr -- ni te -- vi gaid'.
}

lyricC = \lyricmode {
Ē -- ē 
}


fullScore = <<
\new ChoirStaff <<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
>>}
\new Lyrics \lyricsto "voiceA" \lyricA
\new Staff = "lower" {<<
\new Voice = "voiceC" { \voiceThree \autoBeamOff \voiceC }
>>}
\new Lyrics \lyricsto "voiceC" \lyricC
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



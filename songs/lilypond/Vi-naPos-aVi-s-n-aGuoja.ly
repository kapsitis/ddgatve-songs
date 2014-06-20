\version "2.13.16"
%\header {
%    title = "Vilks dara alu"
%}
% V.Muktupāvels. Kokles un koklēšana Latvijā, 2009, p.101
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


voiceMain = \relative c' {
\clef "treble"
\key c \major
\time 3/4
e8 f g4 g | a8 a g4. f8 | e8 f g4 g | a8 a g4. f8 |
e4 f e8 e | d8 d e4. d8 | e4 f e8 e | d8 d e2
\bar "|."
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
\override Score.RehearsalMark #'direction = #DOWN
\mark "Kokle"
<<g8 c e>> f^\markup{ × } <<c4 e g>> <<c, e g>> | <<a,8 c f a>> <<a, c f a>> <<c,4. e g>> f8^\markup{ × } |
<<g,8 c e>> f^\markup{ × } <<c4 e g>> <<c, e g>> | <<a,8 c f a>> <<a, c f a>> <<c,4. e g>> f8^\markup{ × } |
<<g,4 c e>> <<g,4 d' f>> <<g,8 c e>> <<g, c e>> | <<g,8 d'>> <<g, d'>> <<g,4. c e>> d8^\markup{ × } |
<<g,4 c e>> <<g,4 d' f>> <<g,8 c e>> <<g, c e>> | <<g,8 d'>> <<g, d'>> <<g,2 c e>> 
\bar "|."
}

lyricA = \lyricmode {
Vī -- na po -- ša vīš -- ņa guo -- ja, puor a -- za -- ru lei -- guo -- da -- ma.
Vī -- na po -- ša vīš -- ņa guo -- ja, puor a -- za -- ru lei -- guo -- dam'.
} 

chordsA = \chordmode {
\time 3/4 
c2.:5  | f4:5 c2:5 | c2.:5 | f4:5 c2:5 | 
c4:5 g4:7 c4:5 | g4:7 c2:5 | c4:5 g4:7 c4:5 | g4:7 c2:5
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceMain" { \oneVoice \autoBeamOff \voiceMain }
\lyricsto "voiceMain" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \voiceA }
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



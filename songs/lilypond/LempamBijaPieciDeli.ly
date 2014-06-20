\version "2.13.16"
%\header {
%    title = "Lempim bija pieci dēli"
%}
% J.Vītola t.dz. ar klavieru pavadījumu
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
\key e \minor
\time 4/4
e4 g a g8[ fis] | 
e8[ fis] g4 e e |
c'4 e d4. c8 |
b4 b c b8[ a] |

b4 g a g8[ fis] | 
e8[ fis] g4 e c' |
b4 g a4 g8[ fis] |
e8[ fis] g4 e2 
\bar "|."
} 


lyricAA = \lyricmode {
Lem -- pam bi -- ja pie -- ci dē -- li, ne -- viens ka -- rā ne -- aiz -- gā -- ja, 
Lem -- pam bi -- ja pie -- ci dē -- li, ne -- viens ka -- rā ne -- aiz -- gāj'.
}

lyricAB = \lyricmode {
Lüm -- mel hat -- te vie -- le Söh -- ne, doch zum Krie -- ge taug -- te kei -- ner, 
Lüm -- mel hat -- te vie -- le Söh -- ne, kei -- ner taug -- te für den Krieg. 
}


chordsA = \chordmode {
\time 4/4
e1:m | e1:m | a2:m d2:m7 | e2:m a2:m |
e1:m | e2:m a2:m | e2:m a2:m7 | e1:m
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



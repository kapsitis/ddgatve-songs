\version "2.13.16"
%\header {
%    title = "Nāc, Tu latvju Pestītājs"
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

voiceA = {
\clef "treble"
\key g \minor
\time 4/4
g'4 g' f' bes'  | a'4 a' g'2  |
g'4 bes' c'' bes'  | c''4 d'' bes'2  |
bes' 4 c'' d'' bes' | c'' 4 a' g' 2  |
g'4 g' f' bes'  | a'4 a' g'2  |
\bar "|."
}

voiceB = {
\voiceTwo
d'4 c' d' d'  | ees'4 d' d'2  |
ees'4 f' ees' d'8 e' | f'4 f' g'2  |
f'4 f' f' g'8 f' | ees'4 d' d'2  | 
ees'4 ees' d' d' | ees'4 d'8 c' bes2  |
}

voiceC = {
\clef "bass"
\key g \minor
\time 4/4
bes4 g a g  | g4 fis8 c' bes2 |
bes4 f g8 a bes4  | a4 bes bes2  |
bes4 a bes bes  | g 4 fis 8 c' bes 2  |
bes4 c'8 bes a4 g  | g4 fis g2  |
}

voiceD = {
g,4 ees d g, | c4 d g,2 |
ees4 d c g | f4 bes, ees2 |
d4 f bes, ees8 d  | c4 d g,2 |
ees4 c d bes, | c4 d g,2 |
}

lyricA = \lyricmode {
Nāc, Tu ļau -- žu Pes -- tī -- tājs,
Ko mums Dievs ir dā -- vi -- nājs,
Bēr -- niņ šķīs -- tas jum -- pra -- vas, 
Par ko vi -- si brī -- nī -- jās.
}


fullScore = <<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new PianoStaff 
<<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \voiceOne \voiceA }
\new Voice = "voiceB" { \voiceTwo \voiceB }
>>}
\new Staff = "lower" {<<
\new Voice = "voiceC" { \voiceThree \voiceC }
\new Voice = "voiceD" { \voiceFour \voiceD }
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



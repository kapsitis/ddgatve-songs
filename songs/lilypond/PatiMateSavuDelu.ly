\version "2.13.16" 
%\header {
% title = "Pati māte savu dēlu"
%}
% 100 tautas dziesmas, J.Vītola aranžējumi.
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
\key g \minor
\time 3/4
g'4 bes a8 g \time 4/4
f4 d g4. fis8 \time 3/4
g4 bes a8 g \time 4/4
f4 f g4.( fis8) \time 3/4
g4 d' d8 d \time 4/4
c4 c d( c8) d8 \time 3/4
g,4 bes a8 bes \time 4/4 
c4 a g2 
\bar "|."  
}


lyricAA = \lyricmode {
Pa -- ti mā -- te sa -- vu dē -- lu ka -- ra vī -- ru au -- dzi -- nā_-_ja,
stru -- pus svār -- kus šū -- di -- nā -- ja, ga -- rus ma -- tus au -- dzi -- nāj'.
}

lyricAB = \lyricmode {
Hat zum Krie -- ger mich er -- zo -- gen früh die eig' -- ne Mut -- ter schon.
Ließ mir lan -- ge Haa -- re wach -- sen, schnitt mir ei -- nen kur -- zen Rock.
}


chordsA = \chordmode {
\time 3/4
ees2:5 f4:5 \time 4/4
bes2:5 g4:m d4:5 \time 3/4
ees2:5 f4:5 \time 4/4
bes2:5 g4:m d4:5 \time 3/4
g4:m bes2:5 \time 4/4
f2:5 d2:5 \time 3/4
ees2:5 a4:m \time 4/4
a4:m7 d4:7 g2:m
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



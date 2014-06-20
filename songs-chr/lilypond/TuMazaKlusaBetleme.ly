\version "2.13.16"
%\header {
%    title = "Tu mazā, klusā Betleme"
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

voiceA = {
\clef "treble"
\key f \major
\time 4/4
\partial 4*1 
a'4 | a'4 a' gis' a'  | c''4 bes' d' g'  |
f'4 e'8 [ f' ] g'4 c'  | a'2. a'4  |
a'4 a' d'' c''  | c''4 bes' d' g'  |
f'4 e'8 [ f' ] a'4 g'  | f'2. a'4  |
a'4 a' g' f'  | e'2 e'4 e'  |
d'4 e' f' g'  | a'2. a'4  |
a'4 a' gis' a'  | c''4 bes' d' d''  |
c''4 f' a'4. g'8  | f'2. 
\bar "|."
}

voiceB = {
\partial 4*1
c'4 | c'4 c' b c' | ees'4 d' bes d' |
c'4 c' c' c' | c'2. c'4 |
c'4 f' fis' fis' | g'4 d' bes d' |
c'4 c' e' e' | f'2. f'4  |
f'4 f' e' d' | cis'2 cis'4 cis' |
d'4 cis' d' d' | cis'2. c'4  |
c'4 c' b c' | d'4 d' bes d'8 e' |
f'4 b c'4. bes8 | a2.
}

voiceC = {
\clef "bass"
\key f \major
\time 4/4
\partial 4*1
f4 | f4 f f f | fis4 g g bes  |
a4 g8 [ a ] bes4 bes | a2. f4  |
f4 a a d' | d'4 d' d' bes |
a4 gis8 [ a ] c'4 a | a2. c'4 |
c'4 a bes b  | cis'2 cis'4 a |
a4 a a g | e2. f4 |
f4 f f f | fis4 g g bes |
a4 g8 f f4. e8 | f2.
}

voiceD = {
\partial 4*1
f4 | f4 f f f | bes,4 bes, bes, bes, |
c4 c c c | f,2. f4 |
f4 ees d d | g4 g g, bes, |
c4. c8 c4 c | f2. f4 |
f4 f g gis  | a2 a4 a, |
f4 e d bes, | a,2. f,4 |
f,4 f f f | bes,4 bes, bes, bes, |
c4 d c4. c8 | f,2.
}

lyricA = \lyricmode {
Tu ma -- zā, klu -- sā Bet -- le -- me, 
Uz te -- vi do -- mas slīd,
Redz šo -- nakt vi -- sa pa -- sau -- le: 
Pār Te -- vi gais -- ma spīd,
Šai gais -- mā brī -- niš -- ķī -- gā, 
kas tum -- sas va -- ru lauž,
Dzīst rē -- tas, at -- plaukst ce -- rī -- ba, 
Sirds jau -- nu die -- nu jauž.
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



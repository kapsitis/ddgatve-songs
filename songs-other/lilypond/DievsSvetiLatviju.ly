\version "2.13.16"
%\header {
%    subtitle = "Kārlis Baumanis"
%    title = "Dievs, svētī Latviju"
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
\repeat volta 2 { 
f'2 f'4 f' | a'4. g'8 f'2 | 
g'2 g'4 g' | bes'4. a'8 g'2 |
a'2 a'4 a' | c''4. bes'8 a'4 a' |
g'2 a'4 b' |
}
\alternative { { c''2 r2 } { c''2 r2 } }
g'2 g'4 bes' | a'4. g'8 f'2 |
a'2 a'4 c'' | bes'4. a'8 g'2 |
bes'2 bes'4 d'' | c''4. bes'8 a'4 a' |
a'2 g'4 ( bes' ) | a'2 r2 |

g'2 g'4 bes' | a'4. g'8 f'2 |
a'2 a'4 c'' | bes'4. a'8 g'2 |
bes'2 bes'4 d'' | c''4. bes'8 a'4 a' |
a'2 g' | f' 1 |
\bar "|."
}

voiceB = {
\repeat volta 2 {
c'2 c'4 c' | c'4. c'8 c'2 |
c'2 c'4 c' | c'4. c'8 e'2 |
c'2 f'4 c' | c'4. c'8 c'4 c' |
c'2 f'4 f' 
}
\alternative { { e'2 r2 } { e'2 r2 } }
c'2 c'4 c' | c'4. c'8 c'2 |
d'2 d'4 d' | d'4. d'8 d'2 |
d'2 f'4 f' | f'4. c'8 c'4 bes |
c'2 c' | c'2 r2 |
c'2 c'4 c' | c'4. c'8 c'2 |
d'2 d'4 d' | d'4. d'8 d'2 |
d'2 f'4 f' | f'4. c'8 c'4 bes |
c'2 e' | c'1 
}

voiceC = {
\clef "bass"
\key f \major
\time 4/4
\repeat volta 2 {
a2 f4 a | c'4. bes8 a2 |
e2 c4 e | e4. f8 g2 |
f2 c4 f | g4. e8 f4 c |
e2 d4 g } 
\alternative { { g2 r2 } { g2 r2 } }
e2 e4 e | f4. e8 f2 |
fis2 fis4 fis | g4. fis8 g2 |
f2 d'4 bes | a4. e8 f4 f |
f2 e | f2 r2 |
e2 g4 e | f4. e8 f2 |
fis2 a4 fis | g4. fis8 g2 |
f2 bes4 bes | a4. e8 f4 f |
f2 c'4 bes | a1
\bar "|."
}

voiceD = {
\repeat volta 2 {
f,2 a,4 c  | f4. c8 f,2 |
c2 e,4 g, | c4. c8 c2 |
f2 f,4 f, | e,4. c8 f,4 f, |
g,2 g,4 g, }
\alternative { { c4 bes, a, g, } { c2 r2 } }
c2 c4 g, | f,4. g,8 a,2 |
d2 d4 a, | g,4. a,8 bes,2 |
bes,2 bes,4 bes, | f,4. g,8 a,4 d |
c2 c, | f,4 g, a, bes, |
c2 e4 c | f,4. g,8 a,2 |
d2 fis4 d | g,4. a,8 bes,2 |
bes,2 d4 bes, | f,4. g,8 a,4 d |
c2 c | f,1 
}

lyricA = \lyricmode {
Dievs, svē -- tī Lat -- vi -- ju, mūs' dār -- go tē -- vi -- ju,
Svē -- tī jel Lat -- vi -- ju, ak, svē -- tī jel to! to!
Kur lat -- vju mei -- tas zied, Kur lat -- vju dē -- li dzied,
Laid mums tur lai -- mē diet, Mūs' Lat -- vi -- jā!
Kur lat -- vju mei -- tas zied, Kur lat -- vju dē -- li dzied,
Laid mums tur lai -- mē diet, Mūs' Lat -- vi -- jā!
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


\version "2.13.16"
%\header {
%    title = "Čigāns saka čigānami"
%}
%#(set-global-staff-size 18)
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
\time 2/4
%MS
g'8^"Teicēja" fis fis fis | g8 e e e | e8[ g] fis4\fermata | g8[ fis] e4 |
%ME
g8 e e e | g8 fis g4 | g8[ fis] e4 | g8[ fis] e4\fermata |
g8 fis e fis | g8 e g e | e4 fis~ | fis4\fermata e8 r8
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 2/4
R2 | R2 | e8^"Locītājas"[ g] fis4\fermata | g8[ fis] e4 |
e8 d d d | d8 d d4 | d4 e | d4 d\fermata |
d8 d d d | d8 d d d | d4 e~ | e4~ e8 r8 
\bar "|."
} 


lyricA = \lyricmode {
\set stanza = #"1." Či -- gāns sa -- ka či -- gā -- na -- mi, Dui -- do, dui -- do!
Ga -- ļas gri -- bu, ga -- ļas grib', Dui -- do, dui -- do!
Ga -- ļas gri -- bu, ga -- ļas gri -- bu! Dui -- do -- i!
}



fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
>>
}
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



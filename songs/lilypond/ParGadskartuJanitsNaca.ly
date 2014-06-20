\version "2.13.16"
%\header {
%    title = "Par gadskahrtu Jahnits nahza"
%}
% Wihtol, #91
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

voiceFive = #(context-spec-music (make-voice-props-set 4) 'Voice)


voiceMain = \relative c' {
\clef "treble"
\key g \minor
\time 2/4
g'8^\f \mark \markup { \bold "Moderato molto."} a bes c | d8 c16[ bes] a8 g | bes8[ c] d4\fermata | bes4 c | 
d8 d d bes | c8 bes a g | bes8[ a] g4\fermata |
d'8^\mf bes c a | d8 c bes16[ a] g8 | bes8[^\> a]\! g4\fermata |
\bar "|."
}

voiceA = \relative c' {
\clef "treble"
\key g \minor
\time 2/4
g'8[ a bes c] | d8[ c16 bes] a8 g | bes8[ c] d4\fermata | bes4 c | 
d8[ d d bes] | c8[ bes a g] | bes8[ a] g4\fermata |
d'8[ bes c a] | d8 c bes16[ a g8] | bes8[\> a] g4\!\fermata |
\bar "|."
}

voiceE = \relative c' {
s2 | s2 | s2 | s2 | 
s2 | s2 | d2 | 
s2 | s2 | s2
}

voiceB = \relative c' {
\clef "treble"
\key g \minor
\time 2/4
r4 d | g4 fis8 g |  g8 a16 g <<fis4 a>> | <<d,4 g>> <<ees a>> | 
<<d,4. bes'>> <<d,8 f>> |  <<c4 g'>> <<ees fis>> | d8 c bes4 |
d2~ | d4 r8 <<bes8 e>> | r8 <<c fis>> bes,4 |
\bar "|."
}

voiceC = \relative c' {
\clef "bass"
\key g \minor
\time 2/4
\oneVoice r4^\f g8 a | bes8[ c d g16 f!] | ees4 d\fermata | g,4 f~ | 
<<f bes,4.>>  <<bes,8 bes'>> | <<ees,4 ees'>> <<c, c'>> | \voiceThree g8 d' g a |
bes8[^\mf g a c] | bes4  \oneVoice r8 c,8 | r8 d <<g,4\fermata d'>> |
\bar "|."
}

voiceD = \relative c' {
\clef "bass"
\key g \minor
\time 2/4
s2 | s2 | s2 | s2 |
s2 | s2 | g,4~ g8\fermata r8 | 
r8 g4.~ | g4 s4 | s2 |
\bar "|."
}

lyricAA = \lyricmode {
\set stanza = #"1. "
Par gads -- kahr -- tu Jah -- nits nah -- za, lih -- go, lih -- go!
Sa -- wus behr -- nus ap -- rau -- dsi -- ti, lih -- go!
Sa -- wus behr -- nus ap -- rau -- dsi -- ti, lih -- go!
}

lyricAB = \lyricmode {
\override StanzaNumber #'font-shape = #'italic
\set stanza = #"1. "
\override LyricText #'font-shape = #'italic
Jah -- nis nah -- te al -- le Jah -- re, lih -- go, lih -- go!
Sei -- ne Kin -- der heim -- zu -- suh -- chen, lih -- go!
Sei -- ne Kin -- der heim -- zu -- suh -- chen, lih -- go!
}


fullScore = <<
\new Voice = "voiceMain" { \oneVoice \autoBeamOff \voiceMain }
\new Lyrics \lyricsto "voiceMain" \lyricAA
\new Lyrics \lyricsto "voiceMain" \lyricAB
\new PianoStaff 
<<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \voiceOne \voiceA }
\new Voice = "voiceE" { \voiceFive \voiceE }
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



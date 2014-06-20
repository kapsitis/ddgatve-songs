\version "2.13.16"
%\header {
%    title = "Christus vincit"
%}
% http://www.katolis.lv/majori/notis.htm
% http://www.youtube.com/watch?v=SwscJX2gx0E&feature=PlayList&p=D7DCE91D15937CBE&playnext_from=PL&playnext=1&index=26
% http://www.youtube.com/watch?v=1KPUMLZr7ng&feature=related
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

voiceA = \relative c' {
\clef "treble"
\key f \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 2/4 \mark \markup { \circle \bold 1 }
bes'4\mf^\markup {\bold Maestoso} a8_\markup{\bold \italic Organum}[ bes] | c4 
<< { \voiceOne s4 | g2 | a2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo \stemUp f4~ \stemDown | f4 e | f2 }
>> \oneVoice
\bar "||" 
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2 
\bar "||"
\key g \major
\mark \markup { \circle \bold 2 } 
c'4\mf b8_\markup{\bold \italic Organum}[ c] | d4 
<< { \voiceOne s4  | a2  | b2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo \stemUp g4~ \stemDown | g4 fis | g2 }
>> \oneVoice
\bar "||"
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2  
\bar "||"
\key a \major
\mark \markup { \circle \bold 3 } 
d'4\mf cis8_\markup{\bold \italic Organum}[ d] | e4 
<< { \voiceOne s4 | b2 | cis2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo \stemUp a4~ \stemDown | a4 gis | a2 }
>> \oneVoice
\bar "||"
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2  
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
s2 | s2 | s2 | s2 
\bar "||" 
\dynamicUp
a'4\f a^\markup{\bold \italic Chorus} | c4 c \breathe | f,4 f | a4 a \breathe | d4 g, | c4 f,8[ bes] | a4\ff( g8.) f16 | f2 
\bar "||"
\key g \major 
s2 | s2 | s2 | s2 
\bar "||"
b4\f b^\markup{\bold \italic Chorus} | d4 d \breathe | g,4 g | b4 b \breathe | e4 a, | d4 g,8[ c] | b4\ff( a8.) g16 | g2 
\bar "||"
\key a \major
s2 | s2 | s2 | s2 
\bar "||"
cis4\f cis^\markup{\bold \italic Chorus} | e4 e \breathe | a,4 a | cis4 cis \breathe | fis4 b, | e4 a,8[ d] | cis4\ff(  b8.) a16 | a2 
\bar "|."
}

voiceC = \relative c' {
\time 2/4
s2 | s2 | s2 | s2 
\bar "||" 
f4 f | f4 e | d4 d | d4 cis | d4 c | c4 d8[ f] | f4 e | c2 
\bar "||"
\key g \major 
s2 | s2 | s2 | s2
\bar "||"
g'4 g | g4 fis | e4 e | e4 dis | e4 d | d4 e8[ g] | g4 fis | d2
\bar "||"
\key a \major
s2 | s2 | s2 | s2
\bar "||"
a'4 a | a4 gis | fis4 fis | fis4 eis | fis4 e | e4 fis8[ a] | a4 gis | e2     
}


voiceD = \relative c' {
\clef "bass"
\key f \major
\time 2/4
r2 | r4 r8 d~ | <bes d>4 c 
<< { \voiceOne c2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo f,2 }
>> \oneVoice
\bar "||" 
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2
\bar "||" 
\key g \major
r2 | r4 r8 e'8~ | <c e>4 d 
<< { \voiceOne d2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo g,2 }
>> \oneVoice 
\bar "||" 
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2
\bar "||"
r2 | r4 r8 fis'8~ | <d fis>4 e 
<< { \voiceOne e2 }
\new Voice { \set midiInstrument = #"church organ" \voiceTwo a,2 }
>> \oneVoice 
\bar "||"
s2 | s2 | s2 | s2 | s2 | s2 | s2 | s2
}


voiceE = \relative c' {
\clef "bass"
\key f \major
\time 2/4
s2 | s2 | s2 | s2 
\bar "||"
c4 d | c4 a | a4 bes | a4 e | g8[ f] e4 | f8[ e] d[ d'] | c4 bes | a2  
\bar "||" 
\key g \major 
s2 | s2 | s2 | s2 
\bar "||" 
d4 e | d4 b | b4  c | b4 fis | a8[ g] fis4 | g8[ fis] e8[ e'] | d4 c | b2
\bar "||" 
\key a \major
s2 | s2 | s2 | s2  
\bar "||"
e4 fis | e4 cis | cis4 d | cis4 gis | b8[ a] gis4 | a8[ gis] fis[ fis'] | e4 d | cis2
\bar "|."
}

voiceF = \relative c' {
\time 2/4
s2 | s2 | s2 | s2 
\bar "||" 
f,4 d | a4 c | d4 bes | <<f4 f'>> a, | bes4 c8[ bes] | a4 bes8[ g] | a8[ bes] c4 | f2
\bar "||" 
\key g \major
s2 | s2 | s2 | s2
\bar "||" 
g4 e | b4 d | e4 c | g4 b | c d8[ c] | b4 c8[ a] | b8[ c] d4 | g2
\bar "||"
s2 | s2 | s2 | s2 
\bar "||"
a4 fis | cis4 e | fis4 d | <<a4 a'>> cis,4 | d4 e8[ d] | cis4 d8[ b] | cis8[ d] e4 | a2
}

lyricB = \lyricmode {
Chri -- stus vin -- cit, Chri -- stus reg -- nat, 
Chri -- stus, Chri -- stus  im -- pe -- rat! 
Chri -- stus vin -- cit, Chri -- stus reg -- nat, 
Chri -- stus, Chri -- stus  im -- pe -- rat! 
Chri -- stus vin -- cit, Chri -- stus reg -- nat, 
Chri -- stus, Chri -- stus  im -- pe -- rat!
}




fullScore = <<
\new ChoirStaff <<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \set midiInstrument = #"church organ" \oneVoice \autoBeamOff \voiceA }
\new Voice = "voiceB" { \set midiInstrument = #"trumpet" \voiceOne \autoBeamOff \voiceB }
\new Voice = "voiceC" { \set midiInstrument = #"acoustic grand" \voiceTwo \autoBeamOff \voiceC }
>>}
\new Lyrics \lyricsto "voiceB" \lyricB
\new Staff = "lower" {<<
\new Voice = "voiceD" { \set midiInstrument = #"church organ" \oneVoice \autoBeamOff \voiceD }
\new Voice = "voiceE" { \set midiInstrument = #"acoustic grand" \voiceThree \autoBeamOff \voiceE }
\new Voice = "voiceF" { \set midiInstrument = #"acoustic grand" \voiceFour \autoBeamOff \voiceF }
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



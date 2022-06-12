\version "2.13.18"
#(ly:set-option 'crop #t)

% \header {
%    title = "Kur tecēsi, tu pelīte"
%title = "Līgo pele"
%composer = "f/k Laiva"
% }
% Katrīnai, #62  
% http://www.dainuskapis.lv/daina/33494-7-Dazadas-budelu-dziesmas
\paper {
#(set-paper-size "a3")
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
\time 2/4
d8^"Lento" d c c | d d c c | d4 c | d c |
d8 d c c | d d c c | d4 c | d c
d8 d c c | d d c c | d4 c | d c |
d8 d c c | d d c c | d4 c | d c
d8 d c c | d d c c | d4 c | d c |
d8 d c c | d d c c | d4 c | d c
\bar "|."
} 


lyricA = \lyricmode {
\set stanza = #"1. "
Kur te -- cē -- si, tu pe -- lī -- te? Lī -- go, lī -- go. 
Te -- ku pir -- ti ku -- ri -- nā -- tu. Lī -- go, lī -- go. 
Kā tu dū -- mos ne -- no -- slā -- pi? Lī -- go, lī -- go. 
Es pa -- lī -- du pa ze -- mī -- ti. Lī -- go, lī -- go. 
Ko tu ē -- di pa ze -- mī -- ti? Lī -- go, lī -- go.
Sī -- kus o -- lu ak -- men -- ti -- ņus. Lī -- go, lī -- go.
}

lyricB = \lyricmode {
\set stanza = #"2. "
Kā tev sir -- di ne -- no -- spie -- da? Lī -- go, lī -- go. 
Es uz -- dzē -- ru sal -- du pie -- nu. Lī -- go, lī -- go.
Kur da -- bū -- ji sal -- du pie -- nu? Lī -- go, lī -- go.
Svē -- tas Mā -- ras lai -- da -- rā -- i. Lī -- go, lī -- go.
Svē -- tas Mā -- ras lai -- da -- rā -- i. Lī -- go, lī -- go.
Rai -- bas go -- ves pu -- pi -- ņā -- i. Lī -- go, lī -- go.
}

lyricC = \lyricmode {
\set stanza = #"3. "
Kur tā rai -- ba go -- ve jē -- ma?  Lī -- go, lī -- go. 
Za -- ļas zā -- les ra -- si -- ņā -- i. Lī -- go, lī -- go. 
Kur tā za -- ļa zā -- le jē -- ma? Lī -- go, lī -- go. 
Tai ie -- de -- va mīļš Die -- vi -- ņis. Lī -- go, lī -- go.
}

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
d8 c e4 | \times 2/3 { c8 d e } c4 | d8 c e c | \times 2/3 { c8 d e} c4 |
d8 e a4 | \times 2/3 { c,8 d e } g4 | f8 d16 c d8 e | \times 2/3 { c8 d e } c4 |
\autoBeamOff 
d8 d c c | d d c c | d4 c | d c |
d'8 d c c | d d c c | d4 c | d4 c |
\autoBeamOn
f,4 \times 2/3 { a8 g f } | e4 \times 2/3 { g8 f e } | f4 \times 2/3 { a8 g f } | e4 \times 2/3 { g8 f e } |
f4 \times 2/3 { a8 g f } | e4 \times 2/3 { g8 f e } | d16 c d e f g a g | \times 2/3 {e8 f g } c4
\bar "|."
}

voiceC = \relative c' {
\clef "treble"
\key c \major
\time 2/4
a4 a | g4 g | a2 | g2 |
a2 | g2 | a2 | g2 |
a2 | g2 | a2 | g2 |
\autoBeamOff
a8 c f4 | g,8 c e4 | a,8 c f4 | g,8 c e4 | 
a,4 a | g2 | a2 | g2 |
a2 | g2 | a2 | g2
\bar "|."
}


fullScore = <<
\new Voice = "voiceMain" { \set midiInstrument = #"trumpet" \oneVoice \autoBeamOff \voiceMain }
\new Lyrics \lyricsto "voiceMain" \lyricA
\new Lyrics \lyricsto "voiceMain" \lyricB
\new Lyrics \lyricsto "voiceMain" \lyricC

\new PianoStaff 
<<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \set midiInstrument = #"acoustic grand" \voiceOne \voiceA }
>>}
\new Staff = "lower" {<<
\new Voice = "voiceC" { \set midiInstrument = #"acoustic grand" \oneVoice \voiceC }
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



\version "2.13.16"
%\header {
%    title = "Labais biedrs"
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


allowGrobCallback = 
#(define-scheme-function (parser location syms) (symbol-list?) 
   (let ((interface (car syms)) 
         (sym (cadr syms))) 
     #{ 
       \with { 
         \consists #(lambda (context) 
                      `((acknowledgers . 
                          ((,interface . ,(lambda (engraver grob source-engraver) 
                                            (let ((prop (ly:grob-property grob sym))) 
                                              (if (procedure? prop) (ly:grob-set-property! grob sym (prop grob))) 
                                              )))) 
                          )) 
                      ) 
       } 
     #})) 

absFontSize = 
#(define-scheme-function (parser location pt)(number?) 
   (lambda (grob) 
     (let* ((layout (ly:grob-layout grob)) 
            (ref-size (ly:output-def-lookup (ly:grob-layout grob) 'text-font-size 12))) 
       (magnification->font-size (/ pt ref-size)) 
       ))) 



voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
%\tempo 4=80
\partial 4*1
\phrasingSlurDashed
d4 | g4 b8 b b4 a | g2 d4 g8 a | b4 d d c | b2 r4 g8[ a] | 
b4 b b a | b4.( c8) d4 c8[ b] | a4 a a a8[ g] | a4.( b8) c4  d |  
b4 b a a8[ b] | g2 a2 | b4 d a a8[ b] | g2 r4 
\bar "|."
} 

lyricAA = \lyricmode {
\override LyricText.font-shape = #'upright
\override LyricText.font-size = \absFontSize #8
\set stanza = #"1. "
Ich hatt' ei -- nen Ka -- me -- ra -- den, Ei -- nen bes -- sern findst du nit. 
Die Trom -- mel schlug zum Strei -- te, Er ging an mei -- ner Sei -- te
In glei -- chem Schritt und Tritt, in glei -- chem Schritt und Tritt.
}

lyricAB = \lyricmode {
\override LyricText.font-shape = #'italic
\override LyricText.font-size = \absFontSize #8
Man kriet -- nis _ bied -- ris bi -- ja, tāds _ re -- ti at -- ga -- dās. 
Kad liel -- ga -- ba -- li rū -- ca un ka -- ra bun -- gas dū -- ca, 
Viņš no man' ne -- šķī -- rās, Viņš no man' ne -- šķī -- rās.
}

lyricAC = \lyricmode {
\override LyricText.font-shape = #'upright
\override LyricText.font-size = \absFontSize #8
\set stanza = #"2. "
Eine Ku -- gel _ kam ge -- flo -- gen:
Gilt sie mir oder gilt sie dir?
Ihn hat es weg -- ge -- ri -- ssen,
Er liegt vor mei -- nen Fü -- ßen,
Als wär's ein Stück von mir.
Als wär's ein Stück von mir.
}

lyricAD = \lyricmode {
\override LyricText.font-shape = #'upright
\override LyricText.font-size = \absFontSize #8
\set stanza = #"3. "
Will mir die _ Hand noch rei -- chen,
Der -- _ -- weil ich e -- ben lad.
Kann dir die Hand nicht ge -- ben,
Bleib du im ew' -- gen Le -- ben
Mein gu -- ter Ka -- me -- rad!
Mein gu -- ter Ka -- me -- rad!
}

lyricAE = \lyricmode {
\override LyricText.font-shape = #'italic
\override LyricText.font-size = \absFontSize #8
Vēl viņš man _ ro -- ku snie -- dza, 
Kad _ plin -- ti lā -- dē -- ju. 
Tev ro -- ku dot ne -- va -- ru, 
Lai Dievs ņem ta -- vu ga -- ru-
To no sirds vē -- lē -- ju.
To no sirds vē -- lē -- ju.
}



fullScore = <<
\chords { s4 g2.:5 d4:5 g1:5 g2.:5 d4:7 
g1:5 g1:5 g1:5 d1:5 d1:5 g2:5 d2:5 e2:m d2:5 g2:5 d2:7 g2.:5 }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
\lyricsto "voiceA" \new Lyrics \lyricAC
\lyricsto "voiceA" \new Lyrics \lyricAD
\lyricsto "voiceA" \new Lyrics \lyricAE
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




\version "2.13.16"
%\header {
%    title = "Saule lāc un Mieness rīt"
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
\slurDashed
f8 f f f | f c c( c) | f e d c | d c c( c) | a c c c | c a' a a  | a g g e | g f f4 
}
} 

lyricA = \lyricmode {
\set stanza = #"1." Sau -- le lāc un Mie -- ness rīt, vīn -- tuļs puiss nu krū -- ga īt. 
Džim -- lai, džim -- lai, džim -- lai rū -- di, džim -- lai rū -- di ral -- lal -- lā.  
} 

lyricB = \lyricmode {
Vīn -- tuļs puiss nu krū -- ga īt, pī -- guo -- jis pi lū -- ga sit. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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


\markup {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "2."
        \column {
          "Celīs augšā, sirdspučeit,"
          "Nuoc pi lūga parunuot." 
          "Uorā līn nu syltas vītas," 
          "Runuosim nu augstas lītas." 
        }
      }
      \hspace #0.1 % adds vertical spacing between verses
      \line { \bold "3."
        \column {
          "Dzeivuosim kai veirs un sīva,"
          "Īsim pīteiktīs pi Dīva." 
          "Soku, soku meilus vuord’s,"
          "Bet atbildes nasagaid’." 
        }
      }
      \hspace #0.1 % adds vertical spacing between verses
      \line { \bold "4."
        \column {
          "Saīt dusmu pylna sirds,"
          "Suoku durvīs sist un spert." 
          "Nu tuos leluos reibēšonas,"
          "Mūstas ļauds nu gulēšonas." 
        }
      }
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "5."
        \column {
          "Suoka nikni suni rīt," 
          "Vacs ar vāzu uorā skrīt." 
          "Skrēju, sātu puori lēču,"
          "Čut ni bikšu nasaplēšu." 
        }
      }
      \hspace #0.1 % adds vertical spacing between verses
      \line { \bold "6."
        \column {
           "Atīt muote buordamās,"
           "Vāzu rūkā turādam’ -" 
           "Lobuok krūga dubļus meidi,"
           "Nakai tu pi meitom leidi."
        }
      }
      \hspace #0.1 % adds vertical spacing between verses
      \line { \bold "7."
        \column {
           "Kam tūs večus Dīvs turēja," 
           "Itam nikuo naderēja." 
           "Jaunim ļaudim delas maisa,"
           "Un par lelu škādi taisa."
        }
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}


\version "2.20.0"

\header {
	title = "Violin Harmonics"
	composer = "Arranged by Agatha Mallett"
	tagline = \markup{""}
		%\markup {
		%	Engraved at
		%	\simple #(strftime "%Y-%m-%d" (localtime (current-time)))
		%	with \with-url #"http://lilypond.org/"
		%	\line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
		%}
}

\language "english"

\layout {
	indent       = 2.5\cm
	short-indent = 2.5\cm
}

#(set! paper-alist (cons '("mysize" . (cons (* 50 cm) (* 32 cm))) paper-alist)) 
\paper {
  #(set-paper-size "mysize")
}



%\once \override TextScript.extra-offset = #'(-5 . 0)
\markup{
	\column{
		\line{ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
		\line{ "“Harmonics” are produced when a string is made to vibrate at a higher pitch" }
		\line{ "than would be expected from its length. On a violin, this produces a “hollow”" }
		\line{ "sound, often much higher than the original note. This effect can be desirable." }
		\line{ " " }
		\line{ "Suppose the string (either an open string or a fingered string) is vibrating at" }
		\line{ "some pitch (the “fundamental”). We now" \italic "lightly" "place a finger on a “node” of" }
		\line{ "the string: a point that divides the string into a whole number of parts. The" }
		\line{ "finger is placed lightly so that both sides of the string can vibrate; this" }
		\line{ "causes the string to sound as a harmonic instead of the fundamental." }
		\line{ " " }
		\line{ "Nodes exist at many places along the string. In general, placing the finger at" }
		\line{ "a fraction X/Y up the string, where X/Y is a fraction in" \italic "lowest-possible" }
		\line{ "terms, will cause the string to vibrate with a wavelength 1/Y the string's" }
		\line{ "current length. For example, lightly placing a finger 3/5 of the way up the" }
		\line{ "string causes it to vibrate at 1/5 its length, producing a pitch two octaves" }
		\line{ "and a major third above the string's frequency (so, e.g. on the D string, which" }
		\line{ "is pitch D4, the resulting sound would be F♯6). In practice, the smaller the" }
		\line{ "denominator, the less clear the tone becomes and the finer the precision is" }
		\line{ "required to hit the node acceptably. Also, at higher harmonics, the note" }
		\line{ "produced starts falling noticeably off the standard equal-temperament scale." }
		\line{ "For these reasons, divisions smaller than sixths are not used." }
		\line{ " " }
		\line{ "When the fundamental pitch is just the open string itself, the harmonic is" }
	}
	\column{
		\line{ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
		\line{ "called a “natural harmonic”. If the fundamental pitch is fingered, the harmonic" }
		\line{ "is called an “artificial harmonic”. Harmonics are unfortunately notated in" }
		\line{ "various inconsistent ways in practice, but ideally:" }
		\line{ " " }
		\line{ "• Natural harmonics are notated as an open notehead on the" \italic "location" "where the" }
		\line{ "   finger should go. Note that the harmonic note that" \italic "sounds" "can be different" }
		\line{ "   from this!" }
		\line{ "• Artificial harmonics are similar, but with an additional closed notehead for" }
		\line{ "   the fundamental." }
		\line{ "• Natural octave harmonics are treated specially, as a closed notehead with an" }
		\line{ "   open-circle articulation." }
		\line{ "• It is considerate to the musician to also indicate the sounded note (e.g. as a" }
		\line{ "   parenthesized, small, closed, stemless notehead) in the score. This helps" }
		\line{ "   the performer understand the musical intent of the harmonics, and allows" }
		\line{ "   for easier determination of alternate fingerings, if they cannot manage the" }
		\line{ "   fingerings in the score." }
		\line{ " " }
		\line{ "The first harmonic (division by two) is achieved by fingering the octave. For" }
		\line{ "artificial harmonics, especially at lower positions, this is very difficult or" }
		\line{ "impossible to achieve due to the hand's size. The second harmonic (division by" }
		\line{ "three) is achieved by fingering the fifth, the third harmonic (division by" }
		\line{ "four) by fourths, the fourth harmonic (division by five) by major thirds, and" }
		\line{ "the fifth harmonic (division by six) by minor thirds. Note that we can finger" }
	}
	\column{
		\line{ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
		\line{ "other nodes to get the same effect (e.g. 3/5 instead of 1/5). This is only" }
		\line{ "helpful for natural harmonics. For artificial harmonics, the 1/Y node will" }
		\line{ "always be easiest in everything except possibly the highest positions;" }
		\line{ "consequently, these fingerings have been omitted from the chart." }
		\line{ " " }
		\line{ "Harmonics produced by fingering octaves or fourths are perfect (they produce" }
		\line{ "the denoted equal-temperament harmonic exactly). Harmonics produced by" }
		\line{ "fingering fifths or minor thirds are slightly imperfect (they are slightly" }
		\line{ "sharp, and must be fingered slightly sharp to get them to sound). Harmonics" }
		\line{ "produced by fingering major thirds are very imperfect (they sound, and must be" }
		\line{ "fingered, quite flat)." }
		\line{ " " }
		\line{ "Extant fingering charts for violin harmonics are incomplete, or even incorrect;" }
		\line{ "this is my attempt to do better. This chart shows all the “reasonable”" }
		\line{ "harmonics (in the manner discussed above) that can be produced on a violin for" }
		\line{ "four octaves starting at the lowest-attainable harmonic, G4. The chart follows" }
		\line{ "the standard notation of IV, III, II, and I being the G, D, A, and E strings," }
		\line{ "respectively. The artificial harmonics are grouped on the bottom five staves by" }
		\line{ "the interval required, while all natural harmonics are collected on the second" }
		\line{ "staff. Harmonics are colored according to a qualitative measure. Red harmonics" }
		\line{ "are very hard to play; yellow harmonics are hard to play or significantly out-" }
		\line{ "of-tune; green harmonics are okay to play or only slightly out of tune; black" }
		\line{ "harmonics are easy to play and perfectly in-tune." }
	}
}
\markup{\left-column{\line{" "}\line{" "}}}



\score {
	\new StaffGroup <<
		\new Staff {
			\set Staff.instrumentName = \markup\left-column {
				"Result"
			}
			\set Staff.shortInstrumentName = #"Result"

			\time 1/4
			\teeny
			\override Voice.Stem.transparent = ##t
			
			\clef "treble"
			\parenthesize g'    \parenthesize gs'    \parenthesize a'    \parenthesize as'    \parenthesize b'    \parenthesize c''    \parenthesize cs''    \parenthesize d''    \parenthesize ds''    \parenthesize e''    \parenthesize f''    \parenthesize fs''
			\clef "treble^8"
			\parenthesize g''   \parenthesize gs''   \parenthesize a''   \parenthesize as''   \parenthesize b''   \parenthesize c'''   \parenthesize cs'''   \parenthesize d'''   \parenthesize ds'''   \parenthesize e'''   \parenthesize f'''   \parenthesize fs'''
			\clef "treble^15"
			\parenthesize g'''  \parenthesize gs'''  \parenthesize a'''  \parenthesize as'''  \parenthesize b'''  \parenthesize c''''  \parenthesize cs''''  \parenthesize d''''  \parenthesize ds''''  \parenthesize e''''  \parenthesize f''''  \parenthesize fs''''
			\ottava #1
			\parenthesize g'''' \parenthesize gs'''' \parenthesize a'''' \parenthesize as'''' \parenthesize b'''' \parenthesize c''''' \parenthesize cs''''' \parenthesize d''''' \parenthesize ds''''' \parenthesize e''''' \parenthesize f''''' \parenthesize fs'''''
			
			\override Voice.Stem.transparent = ##f
			\normalsize
		}



\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Natural Harmonics"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Natural Harmonics"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
g'-\markup{\center-align {\fontsize #-7 "IV"}}-\flageolet
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 d''-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 d'-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 d''-\markup{\center-align {\fontsize #-7 "III"}}-\flageolet>>
\hide r4
\hide r4
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 g''-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 c'-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic>>
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 a''-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 a'-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 a''-\markup{\center-align {\fontsize #-7 "II"}}-\flageolet>>
\hide r4
<< \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 b''-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 b'-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 e'-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 b-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic>>
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 d'''-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 as-\markup{\center-align {\fontsize #-7 "IV"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 d'''-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 g'-\markup{\center-align {\fontsize #-7 "III"}}\harmonic>>
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 e'''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 e''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 e'''-\markup{\center-align {\fontsize #-7 "I"}}-\flageolet>>
\hide r4
<< \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 fs'''-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 fs''-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 b'-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 fs'-\markup{\center-align {\fontsize #-7 "III"}}\harmonic>>
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 a'''-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 f'-\markup{\center-align {\fontsize #-7 "III"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 a'''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 d''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic>>
\hide r4
\clef "treble^8"
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 b'''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 b''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic>>
\hide r4
<< \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 cs''''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 cs'''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 fs''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 cs''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic>>
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 e''''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 c''-\markup{\center-align {\fontsize #-7 "II"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 e''''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
 a''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic>>
\hide r4
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 gs''''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 gs'''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 cs'''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
 gs''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic>>
\hide r4
\hide r4
<< \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 b''''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic \\ \override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
 g''-\markup{\center-align {\fontsize #-7 "I"}}\harmonic>>
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
}
\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Artificial Harmonics" "via Octaves"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Artificial Harmonics" "via Octaves"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.5 0.0 0.0) \override Accidental.color=#(rgb-color 0.5 0.0 0.0) \override Stem.color=#(rgb-color 0.5 0.0 0.0)
\hide r4
<gs gs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<a a'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<as as'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<b b'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<c' c''\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<cs' cs''\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
\override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
<d' d''\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<ds' ds''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<e' e''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<f' f''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<fs' fs''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
\override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
\clef "treble^8"
<g' g''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<gs' gs''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<a' a''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<as' as''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<b' b''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<c'' c'''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<cs'' cs'''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<d'' d'''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<ds'' ds'''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<e'' e'''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<f'' f'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<fs'' fs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
\clef "treble^15"
<g'' g'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<gs'' gs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<a'' a'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<as'' as'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<b'' b'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<c''' c''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<cs''' cs''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<d''' d''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<ds''' ds''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<e''' e''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<f''' f''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<fs''' fs''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
\ottava #1
<g''' g''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<gs''' gs''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<a''' a''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<as''' as''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<b''' b''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<c'''' c'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<cs'''' cs'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<d'''' d'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<ds'''' ds'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<e'''' e'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<f'''' f'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
<fs'''' fs'''''\harmonic>-\markup{\center-align {\fontsize #-7 "I"}}
}
\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Artificial Harmonics" "via Fifths"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Artificial Harmonics" "via Fifths"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
<gs ds'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<a e'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<as f'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<b fs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<c' g'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<cs' gs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
\override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
<d' a'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<ds' as'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<e' b'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<f' c''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<fs' cs''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<g' d''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<gs' ds''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<a' e''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<as' f''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<b' fs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
\clef "treble^8"
<c'' g''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<cs'' gs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<d'' a''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<ds'' as''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<e'' b''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<f'' c'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<fs'' cs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<g'' d'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<gs'' ds'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<a'' e'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<as'' f'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<b'' fs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
\clef "treble^15"
<c''' g'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<cs''' gs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<d''' a'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<ds''' as'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<e''' b'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<f''' c''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<fs''' cs''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<g''' d''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<gs''' ds''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<a''' e''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<as''' f''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<b''' fs''''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
}
\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Artificial Harmonics" "via Fourths"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Artificial Harmonics" "via Fourths"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.0 0.0 0.0) \override Accidental.color=#(rgb-color 0.0 0.0 0.0) \override Stem.color=#(rgb-color 0.0 0.0 0.0)
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
<gs cs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<a d'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<as ds'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<b e'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<c' f'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<cs' fs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<d' g'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<ds' gs'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<e' a'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<f' as'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<fs' b'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<g' c''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<gs' cs''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<a' d''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<as' ds''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<b' e''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<c'' f''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<cs'' fs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<d'' g''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<ds'' gs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<e'' a''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<f'' as''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<fs'' b''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
\clef "treble^8"
<g'' c'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<gs'' cs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<a'' d'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<as'' ds'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<b'' e'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<c''' f'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<cs''' fs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<d''' g'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<ds''' gs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<e''' a'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<f''' as'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
<fs''' b'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II"}}
}
\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Artificial Harmonics" "via Major Thirds"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Artificial Harmonics" "via Major Thirds"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.4 0.4 0.0) \override Accidental.color=#(rgb-color 0.4 0.4 0.0) \override Stem.color=#(rgb-color 0.4 0.4 0.0)
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
<gs c'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<a cs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<as d'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<b ds'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<c' e'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<cs' f'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<d' fs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<ds' g'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<e' gs'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<f' a'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<fs' as'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<g' b'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<gs' c''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<a' cs''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<as' d''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<b' ds''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<c'' e''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<cs'' f''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<d'' fs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
\clef "treble^8"
<ds'' g''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<e'' gs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<f'' a''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<fs'' as''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<g'' b''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<gs'' c'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<a'' cs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<as'' d'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<b'' ds'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<c''' e'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<cs''' f'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<d''' fs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
}
\new Staff {
		\set Staff.instrumentName      = \markup\center-column {"Artificial Harmonics" "via Minor Thirds"  }
		\set Staff.shortInstrumentName = \markup\center-column {"Artificial Harmonics" "via Minor Thirds"  }

		\time 1/4
	
\override NoteHead.color=#(rgb-color 0.0 0.4 0.0) \override Accidental.color=#(rgb-color 0.0 0.4 0.0) \override Stem.color=#(rgb-color 0.0 0.4 0.0)
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
\hide r4
<gs b\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<a c'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<as cs'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<b d'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<c' ds'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<cs' e'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<d' f'\harmonic>-\markup{\center-align {\fontsize #-7 "IV"}}
<ds' fs'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<e' g'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<f' gs'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<fs' a'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<g' as'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<gs' b'\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<a' c''\harmonic>-\markup{\center-align {\fontsize #-7 "III,IV"}}
<as' cs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<b' d''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
\clef "treble^8"
<c'' ds''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<cs'' e''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<d'' f''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<ds'' fs''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<e'' g''\harmonic>-\markup{\center-align {\fontsize #-7 "II,III,IV"}}
<f'' gs''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<fs'' a''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<g'' as''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<gs'' b''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<a'' c'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III,IV"}}
<as'' cs'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
<b'' d'''\harmonic>-\markup{\center-align {\fontsize #-7 "I,II,III"}}
}



	>>
}
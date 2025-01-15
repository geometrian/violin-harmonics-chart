# Violin Harmonics Chart

## A Modernized Chart for Producing Harmonics on the Violin

This chart shows all the "reasonable" harmonics (in the manner discussed above) that can be produced on a violin for four octaves starting at the lowest-attainable harmonic, G4.  Natural and artificial harmonics are listed, as well as explanatory text.  Harmonics are colored according to the sound quality produced and the ease with which they can be played.

I am hosting a pre-built version of the chart for your convenience.  Click the following image to download the PDF:<br/>
[![Click image to download PDF chart](https://geometrian.com/data/arts/music/violin-harmonics-chart-preview.png)](https://geometrian.com/data/arts/music/violin-harmonics-chart.pdf)

## Building and Files List

To build the chart yourself, simply run pass [violin-harmonics-chart.ly](violin-harmonics-chart.ly) to [LilyPond](https://lilypond.org/).

There are also two [Python](https://www.python.org/) scripts that were used to create the [violin-harmonics-chart.ly](violin-harmonics-chart.ly) file.  The [gen-staves.py](gen-staves.py) script generates all except the first staff's content.  Doing this programmatically helps to ensure that all harmonics are included, and are treated consistently.  The [gen-caption.py](gen-caption.py) script formats [caption.txt](caption.txt) into a suitable format for inclusion into LilyPond.

## TODO

- Validation by (more) musicians.
- Adjust the colors, especially for octaves and fifths?
- Cleanup of the LilyPond markup.  Currently it is very verbose.
- Conversion to LaTeX document, for better typesetting especially in the description.

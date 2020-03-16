from math import *



scale          = ["C","C♯","D","D♯","E","F","F♯","G","G♯","A","A♯","B"]
scale_lilypond = ["c","cs","d","ds","e","f","fs","g","gs","a","as","b"]

def strings_lilypond_font(stringsnames):
	return "-\\markup{\\center-align {\\fontsize #-7 \""+stringsnames+"\"}}"

class Note(object):
	def __init__(self,name,octave,error=0):
		self.name = name
		self.index = scale.index(self.name)
		self.octave = octave
		self.error = 0.0 #in cents
	def __add__(self, semitones):
		index = self.index + semitones
		octave = self.octave
		while index < 0:
			index += 12
			octave -= 1
		while index >= 12:
			index -= 12
			octave += 1
		return Note(scale[index],octave,self.error)
	def __eq__(self,other):
		if self.index !=other.index:  return False
		if self.octave!=other.octave: return False
		return True
	def __lt__(self,other):
		if   self.octave< other.octave: return True
		elif self.octave==other.octave and self.index<other.index: return True
		return False
	def __le__(self,other):
		return self<other or self==other
	def __gt__(self,other):
		if   self.octave> other.octave: return True
		elif self.octave==other.octave and self.index>other.index: return True
		return False
	def __ge__(self,other):
		return self>other or self==other
	def to_lilypond(self):
		s = scale_lilypond[self.index]
		octave_rel = self.octave - 3
		if   octave_rel<0: s+=","*-octave_rel
		elif octave_rel>0: s+="'"* octave_rel
		return s
	def __str__(self):
		s = self.name
		if self.octave>=0: s+=    str(self.octave)
		else:              s+="("+str(self.octave)+")"
		#if self.error!=0.0: s+="(%+f cents)"%self.error
		return s
G3 = Note("G",3)
D4 = Note("D",4)
A4 = Note("A",4)
E5 = Note("E",5)

def stringfraction_to_pitchratio(fraction):
	#Frequency is inversely proportional to length
	#return 1.0 / (fraction[0]/fraction[1])
	return float(fraction[1]) / float(fraction[0])
def stringfraction_to_semitones(fraction):
	pitchratio = stringfraction_to_pitchratio(fraction)
	return log(pitchratio) / log(2.0**(1.0/12.0))
def stringfraction_to_note(fraction,basenote=Note("C",0)):
	semitones = stringfraction_to_semitones(fraction)
	isemi = int(round(semitones))
	error = 100.0*(semitones - isemi)
	result = basenote + isemi
	result.error = error
	return result

class Harmonic(object):
	def __init__(self, string, basenote,fraction):
		self.string     = string
		self.stringname = ["I","II","III","IV"][self.string-1]
		self.note_base    = basenote
		self.note_notated = stringfraction_to_note(fraction,       basenote)
		self.note_sound   = stringfraction_to_note((1,fraction[1]),basenote)
		self.fraction = fraction
		self.is_natural = self.note_base==[E5,A4,D4,G3][self.string-1]
	def to_lilypond(self,with_str=True):
		if self.is_natural:
			s = self.note_notated.to_lilypond()# + "\\"+str(self.string)
			if with_str: s+=strings_lilypond_font(self.stringname)
			if self.fraction == (1,2):
				#Natural octave
				s += "-\\flageolet"
			else:
				s += "\\harmonic"
		else:
			s = "<"+self.note_base.to_lilypond()+" "+self.note_notated.to_lilypond()+"\\harmonic>"
			if with_str: s+=strings_lilypond_font(self.stringname)
		return s
	def __str__(self):
		s = str(self.note_sound)
		s += " produced by "+self.stringname+" + "
		if self.is_natural:
			s += "natural"
		else:
			s += str(self.note_base)+" "
		s += " " + str(self.fraction[0])+"/"+str(self.fraction[1])
		return s



harmonics = []
for strnum,strnote in [ (4,G3), (3,D4), (2,A4), (1,E5) ]:
	basenotes = [strnote]
	#while basenotes[-1].octave < 8:
	#	basenotes.append(basenotes[-1]+1)
	for i in range(1,24+2+1,1):
		basenotes.append(strnote+i)
	for basenote in basenotes:
		for fraction in [
			(1,2),
			(1,3), (2,3),
			(1,4), (3,4),
			(1,5), (2,5), (3,5), (4,5),
			(1,6), (5,6)
		]:
			if basenote is not basenotes[0] and fraction[0]!=fraction[1]-1:
				#This indicates an artificial harmonic using an upper node instead of the primary
				#	node.  This will be impossible in all the but highest positions, and will likely
				#	never be useful.
				continue
			harmonics.append(Harmonic( strnum, basenote,fraction ))

#Output
#	Note: due to an apparent bug in LilyPond, must re-specify `\romanStringNumbers` in polyphonic notation.

colors = [
	"0.5 0.0 0.0",
	"0.4 0.4 0.0",
	"0.0 0.4 0.0",
	"0.0 0.0 0.0"
]
rating0_harmonic = "\override NoteHead.color=#(rgb-color "+colors[0]+") \override Accidental.color=#(rgb-color "+colors[0]+") \override Stem.color=#(rgb-color "+colors[0]+")"
rating1_harmonic = "\override NoteHead.color=#(rgb-color "+colors[1]+") \override Accidental.color=#(rgb-color "+colors[1]+") \override Stem.color=#(rgb-color "+colors[1]+")"
rating2_harmonic = "\override NoteHead.color=#(rgb-color "+colors[2]+") \override Accidental.color=#(rgb-color "+colors[2]+") \override Stem.color=#(rgb-color "+colors[2]+")"
rating3_harmonic = "\override NoteHead.color=#(rgb-color "+colors[3]+") \override Accidental.color=#(rgb-color "+colors[3]+") \override Stem.color=#(rgb-color "+colors[3]+")"

def print_staff(staffname,additional_header,callback_isvalid,callback_nextnote,callback_harmonic=lambda harmonic:None):
	staffname_str = ""
	for line in staffname:
		staffname_str += "\""+line+"\" "
	print("""\\new Staff {
		\\set Staff.instrumentName      = \\markup\\center-column {"""+staffname_str+""" }
		\\set Staff.shortInstrumentName = \\markup\\center-column {"""+staffname_str+""" }

		\\time 1/4
	""")
	print(additional_header)
	note = Note("G",4)
	endnote = note + (12+12+12+12)
	while note < endnote:
		valid_harmonics = []
		for harmonic in harmonics:
			if harmonic.note_sound==note and callback_isvalid(harmonic):
				valid_harmonics.append(harmonic)
		num_valid = len(valid_harmonics)
		if   num_valid == 0:
			print("\hide r4")
		elif num_valid == 1:
			callback_harmonic(valid_harmonics[0])
			print(valid_harmonics[0].to_lilypond())
		else:
			are_compatible = True
			for harmonic in valid_harmonics[1:]:
				if valid_harmonics[0].note_base!=harmonic.note_base or valid_harmonics[0].note_notated!=harmonic.note_notated:
					are_compatible = False
					break
			if are_compatible:
				print(valid_harmonics[0].to_lilypond(False),end="")
				stringsnames = ""
				for harmonic in reversed(valid_harmonics):
					stringsnames += harmonic.stringname+","
				stringsnames = stringsnames[:-1]
				print(strings_lilypond_font(stringsnames))
			else:
				print("<<",end="")
				for i in range(num_valid):
					if i!=0: print(" \\\\",end="")
					callback_harmonic(valid_harmonics[i])
					print(" "+valid_harmonics[i].to_lilypond(),end="")
				print(">>")
		note += 1
		callback_nextnote(note)
	print("}")
def rate_harmonic(harmonic):
	if harmonic.is_natural:
		if harmonic.fraction[1] in [2,4]:
			print(" "+rating3_harmonic)
		elif harmonic.fraction[1] in [3,6]:
			print(" "+rating2_harmonic)
		else:
			print(" "+rating1_harmonic)
	else:
		assert False #Not implemented
def nextnote_naturals(note):
	if note==Note("B",6): print("\clef \"treble^8\"")
def nextnote_octaves(note):
	if   note==Note("D",5): print(rating1_harmonic)
	elif note==Note("G",5): print(rating2_harmonic)
	if   note==Note("G",5): print("\clef \"treble^8\"")
	elif note==Note("G",6): print("\clef \"treble^15\"")
	elif note==Note("G",7): print("\ottava #1")
def nextnote_fifths(note):
	if   note==Note("A",5): print(rating2_harmonic)
	if   note==Note("G",6): print("\clef \"treble^8\"")
	elif note==Note("G",7): print("\clef \"treble^15\"")
def nextnote_fourths(note):
	if   note==Note("G",7): print("\clef \"treble^8\"")
def nextnote_majthirds(note):
	if   note==Note("G",7): print("\clef \"treble^8\"")
def nextnote_minthirds(note):
	if   note==Note("G",7): print("\clef \"treble^8\"")
print_staff(("Natural Harmonics",                     ),rating3_harmonic,lambda harmonic:harmonic.is_natural,                                                            nextnote_naturals,rate_harmonic)
print_staff(("Artificial Harmonics","via Octaves"     ),rating0_harmonic,lambda harmonic:not harmonic.is_natural and harmonic.fraction==(1,2),                           nextnote_octaves  )
print_staff(("Artificial Harmonics","via Fifths"      ),rating1_harmonic,lambda harmonic:not harmonic.is_natural and harmonic.fraction in [ (1,3), (2,3)               ],nextnote_fifths   )
print_staff(("Artificial Harmonics","via Fourths"     ),rating3_harmonic,lambda harmonic:not harmonic.is_natural and harmonic.fraction in [ (1,4), (3,4)               ],nextnote_fourths  )
print_staff(("Artificial Harmonics","via Major Thirds"),rating1_harmonic,lambda harmonic:not harmonic.is_natural and harmonic.fraction in [ (1,5), (2,5), (3,5), (4,5) ],nextnote_majthirds)
print_staff(("Artificial Harmonics","via Minor Thirds"),rating2_harmonic,lambda harmonic:not harmonic.is_natural and harmonic.fraction in [ (1,6), (5,6)               ],nextnote_minthirds)

#for harmonic in harmonics:
#	print(str(harmonic))
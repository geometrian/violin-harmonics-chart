import re


MAX_WIDTH = 80
PAD = -15

file = open("caption.txt","r",encoding="utf-8")
data = file.read()
file.close()

data = data.replace("  "," ")
##data = data.replace("\"","\\\"")

#lines = re.split("\n|\\\\\\\\",data)
data = data.replace("\\\\","\n")
##data = data.replace("\n\n","\n")
lines = []
line=""; count=0
for c in data:
	if c == "\n":
		lines.append(line)
		line=""; count=0
		continue
	elif count >= MAX_WIDTH:
		line2 = line
		while line2[-1] not in " -":
			line2 = line2[:-1]
		if line2[-1]==" ": clippedline=line2[:-1]
		else:              clippedline=line2
		clippedline = clippedline.strip()
		if len(clippedline)>0: lines.append(clippedline)
		line = line[len(line2):]
		count = len(line)
	if c == "\n":
		lines.append(line)
		line=""; count=0
	else:
		line+=c; count+=1
lines.append(line)

def output_column(lines):
	print("\t\column{")
	print("\t\t\line{ \""+"~"*(MAX_WIDTH+PAD)+"\" }")
	for line in lines:
		s = "\t\t\line{"
		if line == "":
			s += " \" \" "
		else:
			runs = []
			run = ""
			qmode = 0
			for c in line:
				if c == "\"":
					if qmode==0: c="“"
					else:        c="”"
					qmode = 1 - qmode
				if c == "*":
					runs.append(run)
					run = ""
				else:
					run += c
			if len(run)>0: runs.append(run)
			runs = [run.strip() for run in runs]

			s += " "
			imode = 0
			for run in runs:
				if imode == 1:
					s += "\italic "
				s += "\""+run.replace("~"," ")+"\" "
				imode = 1 - imode

		s += "}"
		print(s)
	print("\t}")
l = len(lines)
onethird  = (  l+2)//3
twothirds = (2*l+2)//3
output_column(lines[:onethird])
output_column(lines[onethird:twothirds])
output_column(lines[twothirds:])

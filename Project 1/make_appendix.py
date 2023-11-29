
import os

files = os.listdir()
print(r"\lstlistoflistings")
for f in files:
	if ".m" in f: print(r"\lstinputlisting[caption = {" + f.replace('_', '\\_') + r"}, label={code:" + f.replace('.m', '').replace('_','') + r"}]{Code/" + f + 	r"}")

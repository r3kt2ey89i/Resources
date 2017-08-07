#!/usr/bin/python

class PSS:
	def __init__(self, word, li=[], res_def=False):
		self._word = word
		self._enum = li
		self._Boolean = False
		if res_def:
			self._listBoolean = True
			self._list = []	
	
	def print_seq(self):
		pre = '' 
		for i in self._word:
			pre += i
		with open('pss', mode='a') as pss:
			pss.write(pre+'\n')

	def build(self,ind):
		if ind == len(self._word):
			if not self._Boolean:
				self.print_seq()
			else:
				self.build_list()
			return
		
		for i in range(len(self._enum)):
			self._word[ind] = self._enum[i]
			self.build(ind+1)

	def build_list(self):
		pre = '' 
		for i in self._word:
			pre += i
		yield pre

	def clear_seq(self,word):
		for i in word:
			if 1 < word.count(i):
				return ''
		return word

	def __get_list__(self):
		return [word for word in self._list if self.clear_seq(word) != '']
					
def get_file(char_list,n):
	seq = [char_list[0] for t in range(n)]
	psS = PSS(seq,char_list)
	psS.build(0)

def generator(char_list,n):
	seq = [char_list[0] for t in range(n)]
	psS = PSS(seq,char_list,res_def=True)
	for nm in psS.build(0):
		print(nm)


if __name__ == "__main__":
	cl = [chr(i) for i in range(33,127)]
	n= int(input("\tlength?"))
	# get_file(cl,n)
	generator(cl,n)

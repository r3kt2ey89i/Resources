#!/usr/bin/python

from multiprocessing import Pool as Tp
import os

def ln(x):
  os.system("python /../l.py")
  
def pl():
  p = Tp(1000)
  arg = [i for i in range(1000)]
  ret = p.map(ln,arg)
  p.close()
  p.join()

if __debug__:
  while 1:
    pl()
    
    

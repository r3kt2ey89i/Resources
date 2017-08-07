#!/usr/bin/env python
# -*- coding: utf-8 -*-


import glob, os, sys
import pandas as pd


class ReadXls:

    def __init__(self):
        self._Q = []

    def open(self):

        os.chdir(sys.argv[-1])
        for file in glob.glob("*.xls"):
            self._Q.append(file)

        #param = self._Q[0].split('.')[0]
        #os.rename(self._Q[0], param+'.csv')


        data = pd.read_html(self._Q[0])
        print(data)

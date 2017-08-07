#!/usr/bin/env python
# -*- coding: utf-8 -*-

import glob, codecs, os
import docx

class Utils:

    def __init__(self, dir_name='', query=''):
        self._path = dir_name
        self._query = query
        self._Q = []
        self._results = []
        
    def walk(self):

        ind = 0 
        os.chdir(self._path)
        for root, subFolders, files in os.walk(self._path):
            for file in files:
                try:
                    if file.endswith(".docx") or file.endswith(".doc"):
                        print(os.path.join(root, file))  
                        self._Q.append(os.path.join(root, file))
                        ind += 1 
                except UnicodeEncodeError as err: 
                    pass

    def search(self):
        for docu in self._Q:
            try:
                doc = docx.Document(docu)
                plainText = ''
                for p in doc.paragraphs:
                    plainText += p.text
                if self._query in plainText:
                    self._results.append(docu)
            except Exception as err: 
                pass
            
    def __repr__(self):
        return repr(self._results)

    def res(self):
        return self._results

if __name__ == "__main__":
    decoded_dir = raw_input("Please input the directory name: ")
    decoded_q = raw_input("Please input the query string: ")
    utils = Utils(dir_name=decoded_dir, query=decoded_q)
    utils.walk() 
    utils.search()  
    res = utils.res()
    for result in res:
        print(result)

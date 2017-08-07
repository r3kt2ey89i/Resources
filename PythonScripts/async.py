#!/usr/bin/env python
# -*- coding: utf-8 -*-


from Networking.Selenium import *


class Async:

    def __init__(self, param):
        self._param = param
        self._work = []
        self._ind = 0

    def new_worker(self,url):
        self._work.append(Cat(url=url,param=self._param))

    def do_work(self):
        self._work[self._ind].get()
        self._ind += 1

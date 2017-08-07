#!/usr/bin/env python
# -*- coding: utf-8 -*-


from Networking.async import Async as syn
from utils.xlsx import *
from Selenium import *
import sys


def enum(param):

    def get_stocks_il():
        BASE_URL = sys.argv[-1]
        param = (sys.argv[-2])
        handler = ReadXls()
        async = syn(param)
        async.new_worker(BASE_URL)
        async.do_work()
        time.sleep(1)
        handler.open()

    if not param:
        return get_stocks_il


if __debug__:
    ret = enum(0)
    ret()

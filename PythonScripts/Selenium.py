#!/usr/bin/env python
# -*- coding: utf-8 -*-

from selenium import webdriver
import time, os


class Cat:

    def __init__(self, url='', param=tuple()):

        self._param = param

        def pre_set():
            fp = webdriver.FirefoxProfile()
            fp.set_preference('browser.download.folderList', 2)
            fp.set_preference('browser.download.manager.showWhenStarting', False)
            fp.set_preference('browser.download.dir', '/home/yt/Downloads/stock')
            fp.set_preference('browser.helperApps.neverAsk.openFile', 'text/csv,application/x-msexcel,application/excel,application/x-excel,application/vnd.ms-excel,image/png,image/jpeg,text/html,text/plain,application/msword,application/xml')
            fp.set_preference('browser.helperApps.neverAsk.saveToDisk', 'text/csv,application/x-msexcel,application/excel,application/x-excel,application/vnd.ms-excel,image/png,image/jpeg,text/html,text/plain,application/msword,application/xml')
            fp.set_preference('browser.helperApps.alwaysAsk.force', False)
            fp.set_preference('browser.download.manager.alertOnEXEOpen', False)
            fp.set_preference('browser.download.manager.focusWhenStarting', False)
            fp.set_preference('browser.download.manager.useWindow', False)
            fp.set_preference('browser.download.manager.showAlertOnComplete', False)
            fp.set_preference('browser.download.manager.closeWhenDone', False)
            return fp

        fixed = pre_set()
        self._driver = webdriver.Firefox(fixed)
        self._url = url

    def get(self):
        self._driver.get(self._url)
        for j in range(len(self._param)):
            a = self._driver.find_element_by_xpath(self._param[j])
            a.click()
            time.sleep(1)
        time.sleep(5)
        self._driver.close()
        return -1


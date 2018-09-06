# -*- coding: utf-8 -*-
"""
Created on Fri Aug  3 11:50:04 2018

@author: stang
"""

import PyPDF2

file = open('2017VerizonAnnualReport.pdf','rb')
pdfreader = PyPDF2.PdfFileReader(file)

#pdfreader.isEncrypted

# If pdf is encrypted:give password in place os rosebud
#pdfreader.decrypt('rosebud')

pdfreader.documentInfo
pdfreader.getNumPages()

pageObj = pdfreader.getPage(2)
page1 = pageObj.extractText()

output = PyPDF2.PdfFileWriter()
output.addPage(page1)
# add output file to write to
outputStream = open("Verizon_output.txt", "wb")
output.write(outputStream)
outputStream.close()

# -*- coding: utf-8 -*-
"""
Created on Fri Aug  3 19:14:59 2018

@author: stang
"""

import PyPDF2
from PyPDF2 import PdfFileWriter, PdfFileReader

PDFfilename = '2017VerizonAnnualReport.pdf'


### Extracts full pages
pfr = PyPDF2.PdfFileReader(open(PDFfilename, "rb")) 

pg4 = pfr.getPage(3)  # extract pg 4
pg8 = pfr.getPage(7)  # extract pg 8

writer = PyPDF2.PdfFileWriter()  # create PdfFileWriter object
# add pages
writer.addPage(pg4)
writer.addPage(pg8)

NewPDFfilename = "allTables.pdf" # filename of your PDF/directory where you want your new PDF to be
with open(NewPDFfilename, "wb") as outputStream: # create new PDF
    writer.write(outputStream) # write pages to new PDF




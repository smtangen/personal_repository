# -*- coding: utf-8 -*-
"""
Created on Sat Aug  4 08:33:36 2018

@author: stang
"""

## Iterate through multiple PDFs with tables
import PyPDF2
from PyPDF2 import PdfFileWriter, PdfFileReader
import os

path = r"C:\Users\stang\Google Drive\MSBA 6310\Trends\PDFs" #path to folder
#page number to extract, added 1 to reflect counting starting at 0
page = 3 
writer = PyPDF2.PdfFileWriter() #create PdfFileWriter object

for pdf in os.listdir(path):
	PDFfilename = path + "/" + pdf
	pfr = PyPDF2.PdfFileReader(open(PDFfilename, "rb")) #PdfFileReader object
	pg2 = pfr.getPage(page) #extract pg 2
	writer.addPage(pg2) #add pg 2

NewPDFfilename = "allTables.pdf" #filename of your PDF/directory where you want your new PDF to be
with open(NewPDFfilename, "wb") as outputStream: #create new PDF
	writer.write(outputStream) # write pages to new PDF
    
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
writer = PyPDF2.PdfFileWriter() #create PdfFileWriter object

for i in range(3,5):
    for pdf in os.listdir(path):
        PDFfilename = path + "/" + pdf
        pfr = PyPDF2.PdfFileReader(open(PDFfilename, "rb")) #PdfFileReader object
        pg = pfr.getPage(i) #extract pg
        writer.addPage(pg) #add pg

for pdf in os.listdir(path):        
    pg = pfr.getPage(10) #extract pg
    writer.addPage(pg) #add pg
        


NewPDFfilename = "Verizon_Financials_2016_2017.pdf" #filename of your PDF/directory where you want your new PDF to be
with open(NewPDFfilename, "wb") as outputStream: #create new PDF
	writer.write(outputStream) # write pages to new PDF
    